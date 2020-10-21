#include<stdio.h>
#define MY_NAME "Imants"
#include "add.h"        // header file, acts like interface

#define ARRAY_SIZE(x) sizeof(x)/sizeof(x[0])


// debug preprocrssor 
// during compilation use  gcc main.c -DDEBUG
#ifdef DEBUG
    #define _D(fmt, args...) printf("DEBUG (%u): " fmt "\n", __LINE__,##args)
#else
    #define _D(fmt, args...)
#endif

// procesure declareation
// int add(int, int);      // define data type of variables in function


float coef[] = {
    #include "coef.dat"
};

int main(void) {
    printf("Hello World!\n");
    printf(MY_NAME);
    printf("\n");
    printf("%u\n",2*add(4,5));
    for (int i=0; i< sizeof(coef)/sizeof(coef[0]); i++)
    //for (int i=0; i< ARRAY_SIZE; i++)
        printf("%f\n", coef[i]);

    _D("Bye cruel world!");

    return 0;
}