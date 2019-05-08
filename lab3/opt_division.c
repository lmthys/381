#include <stdio.h>

void main()
{
	int i;
	for(i = 0; i < 1000; i++)
	{
		int x = 1048576;
		x = x >> 3;
		x = x >> 4;
		x = x >> 5;
	}
}
