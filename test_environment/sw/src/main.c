#include <stdio.h>
#define STR(x)  #x
#define XSTR(x) STR(x)

int main(void){
    printf("Hello, lazy world (from " XSTR(USER) ")!\n");
    return 0;
}
