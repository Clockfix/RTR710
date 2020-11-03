#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>


#define _I(fmt, args...) printf(fmt "\n", ##args)
int fd;

int main(void)
{
	 _I("Openening (acquiring descriptor) \"/dev/mem\" file");
		fd = open("/dev/mem",O_RDWR);
if (fd == -1){

	return 1;
}
	_I("Mapping physical address of the USB controller");

	_I("Reading USB controller's regster range");
		
return 0;
}
