#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "image.h"
#include "timer.h"
#include "utils.h"
#include <sys/file.h>

void help(char *exec){
    printf("USAGE:\n");
    printf("\t%s <path to image>\n", exec);
}

int main(int argc, char *argv[]){
    image_t image, imageGray, imageDarker, imageSobelHor, 
        imageSobelVer, imageMedian, imageAverage;

    unsigned timeGray, timeDarker, timeSobelHor, 
        timeSobelVer, timeMedian, timeAverage;

    int fd_lock;

    /* parse command line arguments */
    if(argc < 2){
        help(argv[0]);
        return 0;
    }

    /* creating lock file */
    fd_lock = open(".lock_file", O_CREAT, O_RDWR);
    if(fd_lock == -1){
        _E("Failed to create lock file");
        return -1;
    }

    _I("Acquiring application lock");
    flock(fd_lock, LOCK_EX);

    /* open and load image */
    _I("Loading input image...");
    if(image_load(&image, argv[1]) == -1){
        _E("Failed to load image");
        return -1;
    }

    /* image identity (test) */
    _I("Saving identity image...");
    image_savePng("0_identity.png", &image);

    /* image to grayscale */
    _I("Converting image to grayscale...");
    timer_us_start();
    image_toGrayscale(&imageGray, &image);
    timeGray = timer_us_stop();
    image_savePng("1_grayscale.png", &imageGray);

    /* image "darkener" */
    _I("Making image darker...");
    timer_us_start();
    image_darkener(&imageDarker, &imageGray, 40);
    timeDarker = timer_us_stop();
    image_savePng("2_darker.png", &imageDarker);

    /* image horizontal sobel filter */
    _I("Applying horizontal sobel filter...");
    timer_us_start();
    image_sobelHor(&imageSobelHor, &imageGray);
    timeSobelHor = timer_us_stop();
    image_savePng("3_sobelHor.png", &imageSobelHor);

    /* image vertical sobel filter */
    _I("Applying vertical sobel filter...");
    timer_us_start();
    image_sobelVer(&imageSobelVer, &imageGray);
    timeSobelVer = timer_us_stop();
    image_savePng("4_sobelVer.png", &imageSobelVer);

    /* image median filter */
    _I("Applying median filter...");
    timer_us_start();
    image_medianFilter(&imageMedian, &imageGray);
    timeMedian = timer_us_stop();
    image_savePng("5_median.png", &imageMedian);

    /* image median filter */
    _I("Applying averaging filter...");
    timer_us_start();
    image_averagingFilter(&imageAverage, &imageGray);
    timeAverage = timer_us_stop();
    image_savePng("6_average.png", &imageAverage);

    /* display the results */ 
    _I("=== Timing results ===");
    _I("Convert to grayscale: %8u us", timeGray);
    _I("Darkener:             %8u us", timeDarker);
    _I("Horizontal Sobel:     %8u us", timeSobelHor);
    _I("Verticla Sobel:       %8u us", timeSobelVer);
    _I("Median filter:        %8u us", timeMedian);
    _I("Averaging filter:     %8u us", timeAverage);

    _I("Releasing the lock");
    flock(fd_lock, LOCK_UN);

    return 0;
}
