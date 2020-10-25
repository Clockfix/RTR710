#include <stdio.h>
#include <stdint.h>
int main()
{
    double d = 3.1416;
    char ch = *(char*)&d;
    printf("d = %lf\n", d);
    printf("ch =0x%x\n", ch);

    int array[10];
    array[11] = 2;

    return 0;
}