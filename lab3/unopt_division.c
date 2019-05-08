#include <stdio.h>

void main()
{
	int i = 0, x;
	for(; i < 1000; i++)
	{
		x = 1048576;
		x = x / 8;
		x = x / 16;
		x = x / 32;
	}
	printf("x = %d\n", x);
}
