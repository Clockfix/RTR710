#include <stdlib.h>
#include <stdio.h>
#include <math.h>

/* handy macro function to save us some typing time */
#define _I(fmt, args...) printf(fmt "\n", ##args)

/* some global defines */
#define FILTER_START 3
#define FILTER_STOP 11

float filter_average_single(float *input, unsigned window_size)
{
    /* your code goes here */
}

float filter_median_single(float *input, unsigned window_size)
{
    /* your code goes here */
}

/* @brief Provides a moving average filter (n would be the half of the filter
 *        length, i.e. for length 5, n = int(5/2) => 2)
 *        s[i-n]+s[i-n+1]+s[i-n+2]+...+s[i+n]
 *        -----------------------------------
 *                    x
 *
 * NOTE:
 *   take care with the edges of the signal, for this course, you can leave
 *   edges non filtered.
 *
 * @param output         Filtered signal, array of floating point values (aka
 *                       address of a memory region containing the signal
 *                       readings
 * @param input          Signal to be filtered, array of floating point values (aka
 *                       address of a memory region containing the signal
 *                       readings
 * @param sample_count   The length of the signal in samples (length of the array)
 * @param filter_length  The length of the filter to use (number of samples to 
 *                       average)
 * */
void filter_average(float *output, float *input, unsigned sample_count, unsigned filter_length)
{
    /* your code goes here */
    int n;
    n = filter_length / 2;
    // printf("n=%d\n", n);
    // handling first data points. From task description --> for this course, you can leave edges non filtered.
    for (int i = 0; i < n; i++)
    {
        output[i] = input[i];
        // printf("%d, ",i);
    }
    // calculating average
    for (int i = n; i < sample_count - n; i++)
    {
        if (i == n)
        {
            // calculating first average
            output[i] = 0;
            for (int k = 0; k < (filter_length); k++)
            {
                output[i] = output[i] + input[k];
                // printf(",%f ",output[i]);
            }
            output[i] = output[i] / filter_length;
            // printf("\n average %f \n",output[i]);
        }
        else
        {
            output[i] = output[i - 1] + ((input[i + n] - input[i - n - 1]) / filter_length);
            //**********************************************************************
            //      aver[x]   = src[x-1]  +    src[x] +    src[x+1]
            //      aver[x+1] =                src[x] +    src[x+1]   +  src[x+2]
            // then:
            //      aver[x+1] = -src[x-1] +         aver[x]           +  src[x+2]
            //*********************************************************************
            // printf("i+n=%d ",(i+n));
            // printf("i-n=%d \n",(i-n));
        }

        //  printf("%d, ",i);
    }

    // handling last data points. From task description --> for this course, you can leave edges non filtered.
    for (int i = sample_count - 1; i > sample_count - n - 1; i--)
    {
        output[i] = input[i];
        // printf("%d, ",i);
    }
}

/* @brief Provides a median filter, which basically orders samples in an 
 *        accsending order and uses sample in the middle as the output 
 *        reading.
 *
 * NOTE:
 *   take care with the edges of the signal, for this course, you can leave
 *   edges non filtered.
 *
 * @param output         Filtered signal, array of floating point values (aka
 *                       address of a memory region containing the signal
 *                       readings
 * @param input          Signal to be filtered, array of floating point values (aka
 *                       address of a memory region containing the signal
 *                       readings
 * @param sample_count   The length of the signal in samples (length of the array)
 * @param filter_length  The length of the filter to use (number of samples to 
 *                       average)
 * */
void filter_median(float *output, float *input, unsigned sample_count, unsigned filter_length)
{
    /* your code goes here */

    int n;
    n = filter_length / 2;
    // printf("n=%d\n", n);
    // handling first data points. From task description --> for this course, you can leave edges non filtered.
    for (int i = 0; i < n; i++)
    {
        output[i] = input[i];
        // printf("%d, ",i);
    }
    float array[filter_length];
    float temp;
    for (int i = n; i < sample_count - n + 1; i++)
    {
        for (int l = 0; l < filter_length; l++)
        {
            array[l] = input[i - n + l];
            // printf("%f\n ", array[l]);
        }
        // set vector array in order
        for (int l = 0; l < filter_length - 1; l++)
        {
            for (int k = 0; k < filter_length - l - 1; k++)
            {
                if (array[k] > array[k + 1])
                {
                    temp = array[k];
                    array[k] = array[k + 1];
                    array[k + 1] = temp;
                }
                // printf("%f\n ", array[l]);
            }
            // printf("%f\n ", array[l]);
        }
        // if (filter_length == 5)
        // {
        //     for (int l = 0; l < filter_length; l++)
        //     {
        //         printf("array=");
        //         printf(" %f", array[l]);
        //         printf("\n");
        //     }
        //     printf("Median result = %f\n ", array[n]);
        // }
        output[i] = array[n];
    }

    // handling last data points. From task description --> for this course, you can leave edges non filtered.
    for (int i = sample_count - 1; i > sample_count - n - 1; i--)
    {
        output[i] = input[i];
        // printf("%d, ",i);
    }
}

/* @brief Calculates a metric showing how different are the two signals 
 *
 * @param sig0 Signal used for comparison
 * @param sig1 Signal used for comparison
 * @param sample_count The length of the signal in samples
 * 
 * @return The accumulative distance between two signals.
 * 
 * */
float accumulative_error(float *sig0, float *sig1, unsigned sample_count)
{
    float error = 0;

    for (int i = 0; i < sample_count; i++)
    {
        error += fabsf(sig0[i] - sig1[i]);
    }

    return error;
}

void print_usage(char *fname)
{
    printf("USAGE:\n");
    printf("\t%s <input file name> <orig file name> <output file fname>\n", fname);
}

/* Challenge 2: 
 * In this challenge you have to write averaging and median filters for 1-D 
 * signal. If you don't know what they are, you can use the following resources:
 * - Average filter: https://en.wikipedia.org/wiki/Moving_average
 * - Median filter: https://en.wikipedia.org/wiki/Median_filter
 *
 * NOTE: the source code template proposes how to structure your code, but it
 * is up to you to either follow or ignore this suggestion.
 *
 *
 * The main function does the following:
 * 1. Parse the command line arguments to extract filename.
 * 2. Open input/orig/output files.
 * 3. Allocate memory for input/output signals
 * 4. Read input signal
 * 5. Filter signals
 * 6. Write a sample output signal to the file
 * 7. Release previously allocated memory
 * 8. Close files
 * */
int main(int argc, char *argv[])
{
    char *fname_input, *fname_orig, *fname_output;
    FILE *fd_input, *fd_orig, *fd_output;
    float *signal_input, *signal_orig, *signal_output;
    unsigned sample_count = 0;
    char line[256];
    int i = 0;

    /* checking input parameters */
    if (argc < 4)
    {
        print_usage(argv[0]);
        return 0;
    }

    _I("Parsing command line arguments");
    fname_input = argv[1];
    fname_orig = argv[2];
    fname_output = argv[3];

    _I("Opening files");
    fd_input = fopen(fname_input, "r");
    fd_orig = fopen(fname_orig, "r");
    fd_output = fopen(fname_output, "w");
    if ((fd_input == NULL) || (fd_orig == NULL) || (fd_output == NULL))
    {
        _I("FAILED to open files");
        return 1;
    }

    _I("Getting number of input samples and allocating memory");
    char ch;
    while (!feof(fd_input))
    {
        ch = fgetc(fd_input);
        if (ch == '\n')
        {
            sample_count++;
        }
    }
    rewind(fd_input);

    _I("Allocating memory for %u samples", sample_count);
    signal_input = (float *)malloc(sample_count * sizeof(float));
    signal_orig = (float *)malloc(sample_count * sizeof(float));
    signal_output = (float *)malloc(sample_count * sizeof(float));

    _I("Reading input singal");
    i = 0;
    while (fgets(line, sizeof(line), fd_input))
    {
        signal_input[i++] = atof(line);
    }

    _I("Reading original singal");
    i = 0;
    while (fgets(line, sizeof(line), fd_orig))
    {
        signal_orig[i++] = atof(line);
    }

    _I("Initial accumulative signal error: %f", accumulative_error(signal_input, signal_orig, sample_count));

    _I("Running tests");
    float err_average, err_median;
    for (unsigned filter_length = FILTER_START; filter_length <= FILTER_STOP; filter_length += 2)
    {
        filter_average(signal_output, signal_input, sample_count, filter_length);
        err_average = accumulative_error(signal_output, signal_orig, sample_count);

        filter_median(signal_output, signal_input, sample_count, filter_length);
        err_median = accumulative_error(signal_output, signal_orig, sample_count);

        _I("    At filter length: %.2u; Averaging: %.6f; Median: %.6f", filter_length, err_average, err_median);
    }

    _I("Saving filtered result at filter length 5");
    filter_median(signal_output, signal_input, sample_count, 5);
    for (i = 0; i < sample_count; i++)
    {
        fprintf(fd_output, "%f\n", signal_output[i]);
    }

    _I("Releasing memory");
    free(signal_input);
    free(signal_orig);
    free(signal_output);

    _I("Closing files");
    fclose(fd_input);
    fclose(fd_orig);
    fclose(fd_output);

    return 0;
}
