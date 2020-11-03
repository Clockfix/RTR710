#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/types.h>

/* utilities */
#define _I(fmt,args...)  printf(fmt "\n", ##args)
#define _E(fmt,args...)  printf("ERROR: " fmt "\n", ##args)

/* physical address spans */
#define LWHPS2FPGA_BASE   0xff200000 /* physical address of the LWH2F bridge */
#define LWHPS2FPGA_SPAN   0x3000     /* address span to map */
#define HPS2FPGA_BASE     0xc0000000 /* physical address of the H2F bridge */
#define HPS2FPGA_SPAN     0x1000     /* address span to map */

int main(int argc, char *argv[]){
    int i;
    int fd;                   /* file descriptor */
    unsigned char *mem_lwh2f; /* memory pointer for LW HPS2FPGA bridge */

    /* Acquire "/dev/mem" file's descriptor (use "open" syscall) */
    if((fd = open("/dev/mem", O_RDWR|O_SYNC)) < 0){
        _E("Failed to open \"/dev/mem\" file");
        return -1;
    }

    /* Map LWHPS2FPGA physical address to this process (use "mmap" syscall) */
    _I("Mapping physical address - LWHPS2FPGA");
    mem_lwh2f = mmap(0, LWHPS2FPGA_SPAN, PROT_READ | PROT_WRITE, MAP_SHARED, fd, LWHPS2FPGA_BASE);
    if(mem_lwh2f == NULL){
        _E("Failed to map \"LWHPS2FPGA\" bridge");
        return -1;
    }

    _I("Writing 7SEGMENT - 1");
    for(i=0; i<16; i++){
        *(mem_lwh2f+0x2000) = (i<<4) | i;
        usleep(250000);
    }
    _I("Writing 7SEGMENT - 2");
    for(i=0; i<16; i++){
        *(mem_lwh2f+0x2001) = (i<<4) | i;
        usleep(250000);
    }
    _I("Writing 7SEGMENT - 3");
    for(i=0; i<16; i++){
        *(mem_lwh2f+0x2002) = (i<<4) | i;
        usleep(250000);
    }

    // Experimenting with two-byte writes (stores)
    // LAB: your code goes here

    _I("Unmapping physical address");
    munmap(mem_lwh2f, LWHPS2FPGA_SPAN);

    return 0;
}
