#ifndef _UTILS_H_
#define _UTILS_H_

#include <stdio.h>


#define _I(fmt, args...) printf(            fmt "\n", ##args); fflush(stdout)
#define _W(fmt, args...) printf("WARNING: " fmt "\n", ##args); fflush(stdout)
#define _E(fmt, args...) printf("ERROR: "   fmt "\n", ##args); fflush(stdout)
#if defined(DEBUG)
    #define _D(fmt, args...) printf("DEBUG: "  fmt "\n", ##args); fflush(stdout)
#else 
    #define _D(fmt, args...)
#endif

#endif
