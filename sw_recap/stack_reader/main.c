#include <stdio.h>
#include <stdint.h>

#define ARR_SIZE 32

void pollute(){
	uint32_t arr[ARR_SIZE];
	for(int i=0; i<ARR_SIZE; i++){
		arr[i] = 2*i;
	}
}

int main(void){
	uint32_t arr[ARR_SIZE];
	
	printf("ARR start: %p\n", &arr[0]);
	printf("ARR stop:  %p\n", &arr[ARR_SIZE-1]);
	
	for(int i=0; i<ARR_SIZE; i++){
		pollute();
		arr[i] = arr[-i];
	}
	
	for(int i=0; i<ARR_SIZE; i++){
		printf("%p : 0x%x (%u)\n", &arr[-i], arr[i], arr[i]);
	}
	
	return 0;
}