#include <stdio.h>
#include <fcntl.h>  // add aditional *.h file
#include <errno.h>  // add aditional *.h file
#include <unistd.h> // add aditional *.h file
#include <stdlib.h> // add aditional *.h file
#define _I(fmt, args...) printf(fmt "\n", ##args)

void print_usage(char *fname)
{
    printf("USAGE:\n");
    printf("\t%s <input file name> <output file fname>\n", fname);
}

/* Challenge 1: 
 * 1. Parse the command line arguments to extract the filename.
 * 2. Open input/output files.
 * 3. Convert all the contents of input file to uppercase and save the result in
 *    the output file.
 * 4. Close input/output files.
 *
 * HINT:
 *      argc stands for argument count, but argv for argument value,
 *      essentially argv is an array of pointers (of type char*)
 *
 *      It is worthwile to learn something about ASCII, here is the link
 *      http://www.asciitable.com
 *
 *      Do you see any mathematical relationship between lower and upper case 
 *      characters?
 * */
int main(int argc, char *argv[])
{

    /* checking input parameters */
    if (argc < 3)
    {
        print_usage(argv[0]);
        return 0;
    }

    _I("Parsing command line arguments");
    /* your code goes here */
    char *fname_in, *fname_out;
    fname_in = argv[1];
    fname_out = argv[2];

    _I("Opening files");
    /* your code goes here */

    FILE *f = fopen(fname_in, "r");
    FILE *w = fopen(fname_out, "w");
    if ((f == NULL) || (w == NULL))
    {
        _I("FAILED to open files");
        return 1;
    }

    _I("Converting inputs");
    /* your code goes here */

    // determining size of file
    fseek(f, 0, SEEK_END);
    long fsize = ftell(f);
    fseek(f, 0, SEEK_SET);
    // content loaded to string
    char *string = malloc(fsize + 1);
    fread(string, 1, fsize, f);

    string[fsize] = 0;
    // converting all characters to uppercase
    for (int i = 0; i < fsize; i++)
    {
        // detecting lowercase characters
        if ((string[i] > 0x60) && (string[i] < 0x7b))
        {
            string[i] = string[i] - 0x20;
        }
    }
    // print out string
    // _I("%s", string);
    // Write string to file
    int wr;
    wr = fwrite(string, 1, fsize, w);
    free(string);
    // free(wr);    //  Coment: Free on line 85 is incorrect, the variable "wr" is allocated on the stack
                    //*************************************************************  
                    //  Memory for wr is allocated in the main's call stack frame 
                    //  and will be released as soon as main returns.
                    //**************************************************************
    _I("Closing files");
    /* your code goes here */
    fclose(f);
    fclose(w);
    return 0;
}
