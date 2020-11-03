#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>

#define _I(fmt, args...) printf(fmt "\n", ##args)
#define _E(fmt, args...) printf("ERROR: "fmt "\n", ##args)

#define MMAP_SIZE   4096
//#define MMAP_OFFSET 0xffb00000   /* USB0 base address */
#define MMAP_OFFSET 0xffb40000   /* USB1 base address */

int main(void){
    int fd;
    uint32_t *ptr;
    int ret;

    _I("Opening (acquiring descriptor) \"/dev/mem\" file");
    fd = open("/dev/mem", O_RDWR);
    if(fd == -1){
        _E("Failed to open \"/dev/mem\" file");
        return 1;
    }

    _I("Mapping physical address of the USB controller");
    ptr = mmap(NULL, MMAP_SIZE, PROT_READ | PROT_WRITE,
         MAP_SHARED, fd, MMAP_OFFSET);
    if((int)ptr == -1){
        _E("Failed to map physical address");
        return 1;
    }

    _I("Reading USB controller's register range");
    for(uint32_t i=0; i<= 0x40/4; i++){
        _I("Offset: 0x%.2x; Value: 0x%.8x", 4*i, ptr[i]);
    }

    _I("Unmapping physical address of the USB controller");
    ret = munmap(ptr, MMAP_SIZE);
    if(ret == -1){
        _E("Failed to unmap memory");
        return 1;
    }

    _I("Closing (releasing descriptor) \"/dev/mem\" file");
    close(fd);

    return 0;
}
