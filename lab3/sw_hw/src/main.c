#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <string.h>
#include "timer.h"

/* msgdma / cma APIs */
#include "msgdma_api.h"
#include "cma_api.h"

/* single file library for loading images */
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

/* single file library for sabing images */
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// print utilities
#define _I(fmt,args...)  printf(fmt "\n", ##args)
#define _W(fmt,args...)  printf("WARING: " fmt "\n", ##args)
#define _E(fmt,args...)  printf("ERROR: " fmt "\n", ##args)
#define _D(fmt,args...)

#define IMAGE_SIZE(img) (img->width * img->height * img->channels)

typedef struct {
    int      width;
    int      height;
    int      channels;
    uint8_t *data;
} image_t;


/* globals */
msgdma_device_t msgdma_darkener;
msgdma_device_t msgdma_rgb2gray_tx, msgdma_rgb2gray_rx;
msgdma_device_t msgdma_sobelHor;
msgdma_device_t msgdma_combined_tx, msgdma_combined_rx;

/******************** FPGA-related API ********************/
void fpga_darkener(image_t *imageOut, image_t *imageIn){
    struct msgdma_dscr dscr;

    dscr.read_addr  = cma_get_phy_addr(imageIn->data);
    dscr.write_addr = cma_get_phy_addr(imageOut->data);
    dscr.length     = IMAGE_SIZE(imageIn);
    dscr.control    = MSGDMA_DSCR_GO | MSGDMA_DSCR_TRANSFER_COMPLETE_IRQ_MASK;

    write_standard_descriptor(msgdma_darkener, &dscr);
}

void fpga_rgb2gray(image_t *imageOut, image_t *imageIn){
    struct msgdma_dscr dscr_tx, dscr_rx;

    dscr_tx.read_addr  = cma_get_phy_addr(imageIn->data);
    dscr_tx.write_addr = 0x0;
    dscr_tx.length     = IMAGE_SIZE(imageIn);
    dscr_tx.control    = MSGDMA_DSCR_GO;

    dscr_rx.read_addr  = 0x0;
    dscr_rx.write_addr = cma_get_phy_addr(imageOut->data);
    dscr_rx.length     = IMAGE_SIZE(imageOut);
    dscr_rx.control    = MSGDMA_DSCR_GO | MSGDMA_DSCR_TRANSFER_COMPLETE_IRQ_MASK;

    _D("Read Addr:  0x%x", dscr_tx.read_addr);
    _D("Write Addr: 0x%x", dscr_rx.write_addr);
    _D("Read Size:  0x%x", dscr_tx.length);
    _D("Write Size: 0x%x", dscr_rx.length);

    write_standard_descriptor(msgdma_rgb2gray_tx, &dscr_tx);
    write_standard_descriptor(msgdma_rgb2gray_rx, &dscr_rx);
}

void fpga_sobelHor(image_t *imageOut, image_t *imageIn){
    struct msgdma_dscr dscr;

    dscr.read_addr  = cma_get_phy_addr(imageIn->data);
    dscr.write_addr = cma_get_phy_addr(imageOut->data);
    dscr.length     = IMAGE_SIZE(imageIn);
    dscr.control    = MSGDMA_DSCR_GO | MSGDMA_DSCR_TRANSFER_COMPLETE_IRQ_MASK;

    write_standard_descriptor(msgdma_sobelHor, &dscr);
}

void fpga_combined(image_t *imageOut, image_t *imageIn){
    struct msgdma_dscr dscr_tx, dscr_rx;

    dscr_tx.read_addr  = cma_get_phy_addr(imageIn->data);
    dscr_tx.write_addr = 0x0;
    dscr_tx.length     = IMAGE_SIZE(imageIn);
    dscr_tx.control    = MSGDMA_DSCR_GO;

    dscr_rx.read_addr  = 0x0;
    dscr_rx.write_addr = cma_get_phy_addr(imageOut->data);
    dscr_rx.length     = IMAGE_SIZE(imageOut);
    dscr_rx.control    = MSGDMA_DSCR_GO | MSGDMA_DSCR_TRANSFER_COMPLETE_IRQ_MASK;

    _D("Read Addr:  0x%x", dscr_tx.read_addr);
    _D("Write Addr: 0x%x", dscr_rx.write_addr);
    _D("Read Size:  0x%x", dscr_tx.length);
    _D("Write Size: 0x%x", dscr_rx.length);

    write_standard_descriptor(msgdma_combined_tx, &dscr_tx);
    write_standard_descriptor(msgdma_combined_rx, &dscr_rx);
}

/******************** Image API ********************/
int image_load(image_t *image, const char *fname){
    uint8_t *data_cma;

    image->data = stbi_load(fname, &image->width, &image->height, &image->channels, 0);
    if(image->data == NULL){
        _E("Failed to load image");
        return -1;
    }

    data_cma = (uint8_t*)cma_alloc_noncached(IMAGE_SIZE(image));

    if(image->channels == 1){
        for(int i=0; i<image->height*image->width; i++){
            data_cma[3*i+0] = image->data[i];
            data_cma[3*i+1] = image->data[i];
            data_cma[3*i+2] = image->data[i];
        }
    } else if(image->channels == 3){
        memcpy(data_cma, image->data, IMAGE_SIZE(image));
    } else{
        _W("The number of channels is not supported");
    }

    free(image->data);
    image->data = data_cma;
    return 0;
}

int image_savePng(const char *fname, image_t *image){
    return stbi_write_png(
        fname, image->width, image->height, image->channels, image->data, 0);
}

void image_init(image_t *image, int width, int height, int channels, size_t size){
    image->width    = width;
    image->height   = height;
    image->channels = 1;
    image->data     = (uint8_t*)cma_alloc_noncached(size);
}

void image_deinit(image_t *image){
    cma_free(image->data);
}

void print_help(const char *exec){
    _I("USAGE:");
    _I("\n%s <image name>", exec);
}

int main(int argc, char *argv[])
{
    unsigned timeDark;
    unsigned timeGray;
    unsigned timeSobelHor;
    unsigned timeCombined;
    image_t image;
    image_t imageGray;
    image_t imageDarker;
    image_t imageSobelHor;
    image_t imageCombined;

    if(argc < 2){
        print_help(argv[0]);
        return 0;
    }

    _I("Initializing DMAs API");
    msgdma_darkener    = msgdma_init("/dev/msgdma0");
    msgdma_rgb2gray_tx = msgdma_init("/dev/msgdma1");
    msgdma_rgb2gray_rx = msgdma_init("/dev/msgdma2");
    msgdma_sobelHor    = msgdma_init("/dev/msgdma3");
    msgdma_combined_tx = msgdma_init("/dev/msgdma4");
    msgdma_combined_rx = msgdma_init("/dev/msgdma5");
    enable_global_interrupt_mask(msgdma_darkener);
    enable_global_interrupt_mask(msgdma_rgb2gray_rx);
    enable_global_interrupt_mask(msgdma_sobelHor);
    enable_global_interrupt_mask(msgdma_combined_rx);

    _I("Initializing CMA API");
    cma_init();

    _I("Lading image...");
    if(image_load(&image, argv[1]) == -1){
        _E("Failed to load image");
        return -1;
    }

    _I("Initializing images...");
    image_init(&imageGray,     image.width, image.height, 1, IMAGE_SIZE((&image))/3);
    image_init(&imageDarker,   image.width, image.height, 1, IMAGE_SIZE((&image))/3);
    image_init(&imageSobelHor, image.width, image.height, 1, IMAGE_SIZE((&image))/3);
    image_init(&imageCombined, image.width, image.height, 1, IMAGE_SIZE((&image))/3);

    _I("Running rgb2gray conversion...");
    timer_us_start();
    fpga_rgb2gray(&imageGray, &image);
    timeGray = timer_us_stop();

    _I("Running image darkener...");
    timer_us_start();
    fpga_darkener(&imageDarker, &imageGray);
    timeDark = timer_us_stop();

    _I("Running horizontal sobel filtering...");
    timer_us_start();
    fpga_sobelHor(&imageSobelHor, &imageGray);
    timeSobelHor = timer_us_stop();

    _I("Running combined...");
    timer_us_start();
    fpga_combined(&imageCombined, &image);
    timeCombined = timer_us_stop();

    _I("=== Timing results ===");
    _I("Convert to grayscale: %8u us", timeGray);
    _I("Darkener:             %8u us", timeDark);
    _I("Horizontal Sobel:     %8u us", timeSobelHor);
    _I("Combined:             %8u us", timeCombined);

    _I("Saving identity image ...");
    image_savePng("output/0_identity.png", &image);
    _I("Saving grayscale image ...");
    image_savePng("output/1_gray.png", &imageGray);
    _I("Saving darker image ...");
    image_savePng("output/2_dark.png", &imageDarker);
    _I("Saving horizontal sobel image ...");
    image_savePng("output/3_sobel.png", &imageSobelHor);
    _I("Saving combined image ...");
    image_savePng("output/4_combined.png", &imageCombined);

    _I("Deinitializing images...");
    image_deinit(&image);
    image_deinit(&imageGray);
    image_deinit(&imageDarker);
    image_deinit(&imageSobelHor);
    image_deinit(&imageCombined);

    _I("Deinitializing APIs...");
    cma_release();
    msgdma_release(msgdma_darkener);
    msgdma_release(msgdma_rgb2gray_tx);
    msgdma_release(msgdma_rgb2gray_rx);
    msgdma_release(msgdma_sobelHor);
    msgdma_release(msgdma_combined_tx);
    msgdma_release(msgdma_combined_rx);

	return 0;
}
