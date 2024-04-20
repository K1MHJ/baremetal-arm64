/* startup64.s */
  .global _start
_start:
  ldr x0,=sp_top
  mov sp,x0
  bl  init
  ; b   .
