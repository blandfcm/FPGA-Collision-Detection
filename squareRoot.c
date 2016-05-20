#include <stdio.h>
#include <math.h>
float squareRoot(float n)
{
	if(n >= 1)
	{
		float x = n;
		float y = 1.0;
		float e = 0.000001;
		
		while(x - y > e)
		{
			x = (x + y)/2;
			y = n/x;
		}

		return x;
	}
	else
	{
		float x = n;
		float y = 1;
		float e = 0.000001;
		
		while(y - x > e)
		{
			y = (x + y)/2;
			x = n/y;
		}
		return x;
	}
}

int main()
{
	float num0 = 0.5;
	float num1 = 42;
	float num2 = 1.75;
	float num3 = 0.98234;
	float num4 = 12.53;
	float num5 = 0.003;

	float root0 = squareRoot(num0);
	float root1 = sqrt(num0);
	float root2 = squareRoot(num1);
	float root3 = sqrt(num1);
	float root4 = squareRoot(num2);
	float root5 = sqrt(num2);
	float root6 = squareRoot(num3);
	float root7 = sqrt(num3);
	float root8 = squareRoot(num4);
	float root9 = sqrt(num4);
	float root10 = squareRoot(num5);
	float root11 = sqrt(num5);
	
	printf("The sqrt of %f is %f, c sqrt = %f\n", num0, root0, root1);
	printf("The sqrt of %f is %f, c sqrt = %f\n", num1, root2, root3);
	printf("The sqrt of %f is %f, c sqrt = %f\n", num2, root4, root5);
	printf("The sqrt of %f is %f, c sqrt = %f\n", num3, root6, root7);
	printf("The sqrt of %f is %f, c sqrt = %f\n", num4, root8, root9);
	printf("The sqrt of %f is %f, c sqrt = %f\n", num5, root10, root11);
}

