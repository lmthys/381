#include<stdlib.h>

int main()
{
	int i,a=2,b=3;	
	float x=5,y=4,z=3,w=2;

	for(i=0;i<9000;i++)
	{
		a = a + b;
		a = a - b;

		x = x * y;
		x = x / y;
		
		x = x + y + z;
		y = w + x;
		y = y - (w + x);
		x = x - y - z;
	}
return 0;
}
