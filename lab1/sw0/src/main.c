#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/types.h>

/* utilities */
#define _I(fmt, args...) printf(fmt "\n", ##args)
#define _E(fmt, args...) printf("ERROR: " fmt "\n", ##args)

/* physical address spans */
#define LWHPS2FPGA_BASE 0xff200000 /* physical address of the LWH2F bridge */
#define LWHPS2FPGA_SPAN 0x3000     /* address span to map */
#define HPS2FPGA_BASE 0xc0000000   /* physical address of the H2F bridge */
#define HPS2FPGA_SPAN 0x1000       /* address span to map */

void print_usage()
{
    _I("USAGE:");
    _I("./leds.elf <bridge_selector> <led_mask>");
    _I("   0 - LWHPS2FPGA bridge");
    _I("   1 - HPS2FPGA bridge");
    _I("EXAMPLE:");
    _I("./leds.elf 0 0x1f");
}

int main(int argc, char *argv[])
{
    int mask;
    int fd;                   /* file descriptor */
    unsigned char *mem_lwh2f; /* memory pointer for LW HPS2FPGA bridge */
    unsigned char *mem_h2f;   /* memory pointer for HPS2FPGA bridge */
    unsigned char *mem_target;

    if (argc < 3)
    {
        print_usage();
        return 0;
    }

    /* Acquire "/dev/mem" file's descriptor (use "open" syscall) */
    // LAB: your code goes here     <--------------------!!!
    _I("Opening (acquiring descriptor) \"/dev/mem\" file");
    fd = open("/dev/mem", O_RDWR);
    if (fd == -1)
    {
        _E("Failed to open \"/dev/mem\" file");
        return 1;
    }
    /* Map LWHPS2FPGA physical address to this process (use "mmap" syscall) */
    // LAB: your code goes here     <--------------------!!!
    _I("Mapping physical address of the LWHPS2FPGA");
    mem_lwh2f = mmap(NULL, LWHPS2FPGA_SPAN, PROT_READ | PROT_WRITE,
                     MAP_SHARED, fd, LWHPS2FPGA_BASE);
    if ((int)mem_lwh2f == -1)
    {
        _E("Failed to map physical address LWHPS2FPGA");
        return 1;
    }
    /* Map HPS2FPGA physical address to this process (use "mmap" syscall) */
    // LAB: your code goes here     <--------------------!!!
    _I("Mapping physical address of the HPS2FPGA");
    mem_h2f = mmap(NULL, HPS2FPGA_SPAN, PROT_READ | PROT_WRITE,
                   MAP_SHARED, fd, HPS2FPGA_BASE);
    if ((int)mem_h2f == -1)
    {
        _E("Failed to map physical address HPS2FPGA");
        return 1;
    }
    /* select target memory region */
    mem_target = (atoi(argv[1]) == 0) ? mem_lwh2f : mem_h2f;

    /* get LED mask */
    mask = strtoul(argv[2], NULL, 16);

    _I("Waiting for button press...");
    while ((*(mem_lwh2f + 0x1000) & 0x1))
        ;               /* polling for button to be pressed */
    *mem_target = mask; /* writing mask to the LED output */
    _I("Value mask has been written");

    _I("Unmapping physical address");
    munmap(mem_lwh2f, LWHPS2FPGA_SPAN);
    munmap(mem_h2f, HPS2FPGA_SPAN);

    return 0;
}
