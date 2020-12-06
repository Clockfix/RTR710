#ifndef _IMAGE_H_
#define _IMAGE_H_

#include <stdint.h>

typedef struct {
    int    width;
    int    height;
    int    channels;
    unsigned char *data;
} image_t;

int image_load(image_t *image, const char *fname);
int image_savePng(const char *fname, image_t *image);
int image_toGrayscale(image_t *imageOut, image_t *imageIn);
int image_darkener(image_t *imageOut, image_t *imageIn, uint8_t coef);
int image_sobelHor(image_t *imageOut, image_t *imageIn);
int image_sobelVer(image_t *imageOut, image_t *imageIn);
int image_medianFilter(image_t *imageOut, image_t *imageIn);
int image_averagingFilter(image_t *imageOut, image_t *imageIn);

#endif
