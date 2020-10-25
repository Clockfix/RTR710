// header file
#include <stdio.h>
#include "add.h"

// preprocessor constant
#ifndef MY_NAME
#define MY_NAME "Filips"
#endif

// preprocessor macros
#define ARRAY_SIZE(x)  sizeof(x)/sizeof(x[0])
#define SUM(a,b) (a+b)

// debug preprocessor
#ifdef DEBUG
	#define _D(fmt, args...) \
	printf("DEBUG (%u): " fmt "\n", __LINE__, ##args)
#else
	#define _D(fmt, args...)
#endif

// function declarations
//int add(int,int);


float coef[] = {
	#include "coef.dat"
};

int main(void){
	printf("Hello, lazy world! %s\n", MY_NAME);
	
	printf("%u\n", 2*add(4,5));
	
	for(int i=0; i<ARRAY_SIZE(coef); i++)
		printf("%f\n", coef[i]);
	
	_D("Bye cruel world!");
	
	return 0;
}