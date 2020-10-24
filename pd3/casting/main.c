#include <stdio.h>
#include <stdint.h>
#define ARR_SIZE 32

int main()
{
    uint8_t arr[4] = {0x01, 0x02, 0x03, 0x04};

    int32_t *ptr_int; //pointer

    float *ptr_float;

    uint16_t val_uint16t;

    // left: int32_t; right: uint8_t*
    // ptr_int = arr;
    ptr_int = (int32_t *)arr; // record address arr[0]

    printf("addr:%x HEX:0x%x DEC:%d\n", &ptr_float, *&*&*&*ptr_int, *ptr_int);

    // left: int32_t; right: uint8_t8
    ptr_float = (float *)arr; // record address arr[0]

    printf("addr:%x HEX:0x%x DEC:%f\n", ptr_float, *ptr_float, *ptr_float);

    // left: uint16_t; right: uint8_t*
    val_uint16t = *(uint16_t *)arr;
    printf("addr:%x HEX:0x%x DEC:%u\n", &val_uint16t, val_uint16t, val_uint16t);

    return 0;
}