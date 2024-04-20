
static void print(const char *str)
{
	while (*str)
		*(volatile unsigned char *)UART0_PTR = *str++;
}
int init()
{
	print("Hello, world!\n");
  return 0;
} 
