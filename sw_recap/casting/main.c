#include <stdio.h>
#include <stdint.h>

int main(){
	uint8_t arr[4] = {0x01, 0x02, 0x03, 0x04};
	int32_t *ptr_int;
	float   *ptr_float;
	uint16_t val_uint16;
	
	// left: int32_t*, right: uint8_t*
	ptr_int = (int32_t*)arr;
	
	// left: float*, right: uint8_t*
	ptr_float = (float*)arr;
	
	// left: uint16_t, right: uint8_t*
	val_uint16 = *(uint16_t*)arr;
	
	printf("ADDR: %p HEX: 0x%x DEC: %d\n", ptr_int, *&*&*&*ptr_int, *ptr_int);
	printf("ADDR: %p HEX: 0x%x DEC: %f\n", ptr_float, *ptr_float, *ptr_float);
	printf("ADDR: %p HEX: 0x%x DEC: %u\n", &val_uint16, val_uint16, val_uint16);
	
	return 0;
}