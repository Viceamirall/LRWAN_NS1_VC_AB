#include "lrwan_ns1_printf.h"
#include <stdarg.h>
#include "stm32_tiny_vsnprintf.h"
#include <stdio.h>
char LoRa_DBG_Buf[300];    /* Buffer used for AT cmd transmission */

/* generic buffer vprintf function */  

uint16_t dbg_buf_vsnprintf(char * buf, uint16_t buf_size, uint16_t offset, const char *format, va_list args, uint8_t use_tiny)
{
  uint16_t len;
  if (use_tiny) {
    len = tiny_vsnprintf_like(buf + offset, buf_size - offset, format, args);
  } else {
    len = vsnprintf(buf + offset, buf_size - offset, format, args);
  }

  return len;
}

/* format and print a string to debug in PC */ 

HAL_StatusTypeDef dbg_printf_send(const char * format, ...)
{
  va_list args;
  uint16_t len;

  va_start(args, format);
  len = dbg_buf_vsnprintf(LoRa_DBG_Buf, sizeof(LoRa_DBG_Buf), 0, format, args, 0);
  va_end(args);

  return at_printf_send( (uint8_t *) LoRa_DBG_Buf, len);
}
