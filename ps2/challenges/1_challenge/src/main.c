#include <stdio.h>
#define _I(fmt, args...)  printf(fmt "\n", ##args)


void print_usage(char *fname){
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
int main(int argc, char *argv[]){

    /* checking input parameters */
    if(argc < 3){
        print_usage(argv[0]);
        return 0;
    }

    _I("Parsing command line arguments");
    /* your code goes here */


    _I("Opening files");
    /* your code goes here */


    _I("Converting inputs");
    /* your code goes here */


    _I("Closing files");
    /* your code goes here */

    return 0;
}
