#include "lrwan_ns1_atcmd.h"
#include <stdarg.h>

/* generic buffer vprintf format function */  

uint16_t dbg_buf_vsnprintf(char * buf, uint16_t buf_size, uint16_t offset, const char *format, va_list args, uint8_t tiny);

/* format and print a string to debug in PC */ 

HAL_StatusTypeDef dbg_printf_send(const char * format, ...);
