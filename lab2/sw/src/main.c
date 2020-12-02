#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <string.h>
#include <sys/file.h>

#include "timer.h"

#include "msgdma_api.h"
#include "cma_api.h"

#define _I(fmt,args...)  printf(fmt "\n", ##args)
#define _E(fmt,args...)  printf("ERROR: " fmt "\n", ##args)

#define ARRAY_SET_SIZE   16

/* globals */
msgdma_device_t msgdma_to_fpga, msgdma_from_fpga;


/* Add sets with CPU (code not optimized for speed)
 *
 * @out Target memory region
 * @in  Input memory region
 * @set_size Size in bytes of a single set
 * @set_count Total number of sets
 **/
void sum_mpu(uint16_t *out, uint8_t *in, int set_size, int set_count){
    for(int i=0; i<set_count; i++){
        out[i] = 0;
        for(int j=0; j<set_size; j++)
            out[i] += in[i*set_size+j];
    }
}

/* Add sets with FPGA (code not optimized for speed)
 *
 * @out Target memory region
 * @in  Input memory region
 * @set_size Size in bytes of a single set
 * @set_count Total number of sets
 **/
void sum_fpga(uint16_t *out, uint8_t *in, int set_size, int set_count){
    struct msgdma_dscr dscr_to_fpga, dscr_from_fpga;

    dscr_to_fpga.read_addr  = cma_get_phy_addr(in);
    dscr_to_fpga.write_addr = 0;
    dscr_to_fpga.length     = sizeof(*in)*set_size*set_count;
    dscr_to_fpga.control    = MSGDMA_DSCR_GO;

    dscr_from_fpga.read_addr  = 0;
    dscr_from_fpga.write_addr = cma_get_phy_addr(out);
    dscr_from_fpga.length     = sizeof(*out)*set_count;
    dscr_from_fpga.control    = MSGDMA_DSCR_GO | MSGDMA_DSCR_TRANSFER_COMPLETE_IRQ_MASK;

    write_standard_descriptor(msgdma_to_fpga,   &dscr_to_fpga);
    write_standard_descriptor(msgdma_from_fpga, &dscr_from_fpga);
}


int main(int argc, char *argv[])
{
    uint8_t *array_mpu, *array_fpga;
    uint16_t *sums_mpu, *sums_fpga;
    unsigned time_mpu, time_fpga;
    unsigned array_set_count;
    int status;
    int fd_lock;

    if(argc < 2){
        _I("USAGE: %s <number of sets>", argv[0]);
        return 0;
    }
    array_set_count = atoi(argv[1]);

    fd_lock = open("/tmp/.lock_file", O_CREAT, O_RDWR);
    if(fd_lock == -1){
        _E("Failed to create lock file");
        return -1;
    }

    _I("Acquiring application lock");
    flock(fd_lock, LOCK_EX);

    _I("Initializing random number generator");
    srand(time(NULL));

    _I("Initializing DMA API");
    msgdma_to_fpga   = msgdma_init("/dev/msgdma0");
    msgdma_from_fpga = msgdma_init("/dev/msgdma1");
    enable_global_interrupt_mask(msgdma_from_fpga);

    _I("Initializing CMA API");
    cma_init();

    _I("Allocating memory");
    array_mpu  = (uint8_t*)malloc(array_set_count*ARRAY_SET_SIZE);
    sums_mpu   = (uint16_t*)malloc(array_set_count*sizeof(*sums_mpu));
    array_fpga = (uint8_t*)cma_alloc_noncached(array_set_count*ARRAY_SET_SIZE);
    sums_fpga  = (uint16_t*)cma_alloc_noncached(array_set_count*sizeof(*sums_fpga));

    _I("Generating array of random numbers");
    for(int i=0; i<array_set_count*ARRAY_SET_SIZE; i++){
        uint8_t num = rand();
        array_mpu[i]  = num;
        array_fpga[i] = num;
    }

    _I("Adding with MPU");
    timer_us_start();
    sum_mpu(sums_mpu, array_mpu, ARRAY_SET_SIZE, array_set_count);
    time_mpu = timer_us_stop();

    _I("Adding with FPGA");
    timer_us_start();
    sum_fpga(sums_fpga, array_fpga, ARRAY_SET_SIZE, array_set_count);
    time_fpga = timer_us_stop();

    _I("=====");
     status = memcmp(sums_mpu, sums_fpga, sizeof(*sums_mpu)*array_set_count);
    _I("Sum compare check: %s", (status==0)? "SUCCESS" : "FAILURE");
    _I("Time spent on MPU:  %u us", time_mpu);
    _I("Time spent on FPGA: %u us", time_fpga);
    _I("=====");

#ifdef DEBUG
    for(int i=0; i<array_set_count; i++)
        _I("MPU => %u, FPGA => %u", sums_mpu[i], sums_fpga[i]);
#endif

    _I("Deinitializing");
    free(array_mpu);
    free(sums_mpu);
    cma_free(array_fpga);
    cma_free(sums_fpga);
    cma_release();
    msgdma_release(msgdma_to_fpga);
    msgdma_release(msgdma_from_fpga);

    _I("Releasing the lock");
    flock(fd_lock, LOCK_UN);

	return 0;
}
