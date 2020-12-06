/* single file library for loading images */
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

/* single file library for sabing images */
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"


#include "image.h"           /* image API */
#include "utils.h"           /* some useful defines */

static inline void image_copyHeader(image_t *imageOut, image_t *imageIn){
    imageOut->width    = imageIn->width;
    imageOut->height   = imageIn->height;
    imageOut->channels = imageIn->channels;
}

static inline size_t image_size(image_t *image){
    return image->height*image->width*image->channels;
}

int image_load(image_t *image, const char *fname){

    image->data = stbi_load(fname, &image->width, &image->height, &image->channels, 0);
    if(image->data == NULL){
        _E("Failed to load image");
        return -1;
    }

    _D("Frame channels: %d", frame->channels);
    _D("Frame width:    %d", frame->width);
    _D("Frame heigth:   %d", frame->height);

    return 0;
}

int image_savePng(const char *fname, image_t *image){
    return stbi_write_png(
        fname, image->width, image->height, image->channels, image->data, 0);
}

/** @brief Converts input image to grayscale and stores result in imageOut 
 *         struct, the memory is allocated automatically. If input image 
 *         has just a single channel, the data is simply copied.
 *
 *  @param imageOut  target structure of the characterization and data for
 *         the output image
 *  @param imageIn   structure containing characterization and data of the 
 *         input image
 */
int image_toGrayscale(image_t *imageOut, image_t *imageIn){
    image_copyHeader(imageOut, imageIn);
    imageOut->channels = 1;
    imageOut->data = (char*)malloc(image_size(imageOut));

    /* the input image has just a single channel, no conversion required */
    if(imageIn->channels == 1){
        memcpy(imageOut->data, imageIn->data, image_size(imageOut));

    /* input image has 3 channels, store grayscale image in imageOut->data */
    } else if(imageIn->channels == 3){
        /* TODO: your code goes here
         * convert RGB image into grayscale, research has lead to a couple of 
         * ways of doing this, please convert channels by using the following 
         * weights for each channel respectively: 
         * - red  -> 0.2998, 
         * - green -> 0.5870, 
         * - blue -> 0.1140*/


    } else {
        _W("%s: this number of channels (%d) is not supported", 
            __func__, imageIn->channels);
    }
}

/** @brief Essentially makes input image darker.
 *
 *  @param imageOut  target structure of the output image
 *  @param imageIn   structure containing characterization and data of the 
 *         input image
 *  @param coef      coefficient indicating the intensity value by which 
 *         the input image should be made darker
 */
int image_darkener(image_t *imageOut, image_t *imageIn, uint8_t coef){
    image_copyHeader(imageOut, imageIn);
    imageOut->data = (char*)malloc(image_size(imageOut));

    /* TODO: your code goes here
     * Make the pixels darker using the coeficient argument. How do you 
     * think, should the coefficient be added or subtracted? */
}


/** @brief Horizontal Sobel filter.
 *
 *  @param imageOut  target structure of the output image
 *  @param imageIn   structure containing characterization and data of the 
 *         input image
 */
int image_sobelHor(image_t *imageOut, image_t *imageIn){
    image_copyHeader(imageOut, imageIn);
    imageOut->data = (char*)malloc(image_size(imageOut));

    /* TODO: your code goes here
     * Write simple horizontal edge detection algorithm, which uses the
     * following coeficient matrix [-1, 0, 1] for the convolution kernel.
     * Afterwards add an offset of 128, make sure that overflows are dealt 
     * with 
     */
}

/** @brief Vertical Sobel filter.
 *
 *  @param imageOut  target structure of the output image
 *  @param imageIn   structure containing characterization and data of the 
 *         input image
 */
int image_sobelVer(image_t *imageOut, image_t *imageIn){
    image_copyHeader(imageOut, imageIn);
    imageOut->data = (char*)malloc(image_size(imageOut));

    /* TODO: your code goes here
     * Write simple horizontal edge detection algorithm, which uses the
     * following coeficient matrix:
     * [-1] 
     * [ 0]
     * [ 1]. 
     *
     * Afterwards add an offset of 128 and make sure that overflows are dealt 
     * with 
     */
}

static inline uint8_t image_getMedian(uint8_t *arr, int arrSize){
    int swapped = 1;
    uint8_t tmp;

    while(swapped){
        swapped = 0;
        for(int i=0; i<arrSize-1; i++){
            if(arr[i] < arr[i+1]){
                tmp      = arr[i];
                arr[i]   = arr[i+1];
                arr[i+1] = tmp;
                swapped  = 1;
            }
        }
    }
    return arr[arrSize/2];
}

/** @brief Image median filter with 3x3 region of interest.
 *
 *  @param imageOut  target structure of the output image
 *  @param imageIn   structure containing characterization and data of the 
 *         input image
 */
int image_medianFilter(image_t *imageOut, image_t *imageIn){
    image_copyHeader(imageOut, imageIn);
    imageOut->data = (char*)malloc(image_size(imageOut));

    /* TODO: your code goes here
     * Write a simple median filter using [3x3] convolution matrix. You can use
     * "image_getMedian" routine defined above */
}


/** @brief Image averaging filter with 3x3 convolution kernel.
 *
 *  @param imageOut  target structure of the output image
 *  @param imageIn   structure containing characterization and data of the 
 *         input image
 */
int image_averagingFilter(image_t *imageOut, image_t *imageIn){
    image_copyHeader(imageOut, imageIn);
    imageOut->data = (char*)malloc(image_size(imageOut));

    /* TODO: your code goes here
     * Write a simple averagin filter using [3x3] convolution matrix. Make sure
     * the overflows are dealt with. */
}
