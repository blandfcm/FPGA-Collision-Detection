#include <stdio.h>
#include <stdlib.h>

float powf(float x, float y)
{
	float res = 1.0f;
	
	while(y > 0)
	{
		res = res * x;
		y--;
	}
	return res;
}

char* float2bin(float n)
{
	char *exponent = malloc(8);
	int place = 7;
	int i;
	float temp;

	for(i = 0; i< 8; i = i + 1)
	{
		temp = powf(2.0f, place);
		if(n - temp >= 0)
		{
			exponent[i] = '1';
			n = n - temp; 
		}
		else
		{
			exponent[i] = '0';
		}
		place = place - 1;
	}
	
	return exponent;
}

int main()
{
	float n;
	
	printf("Enter a float:\n");
	scanf("%f", &n);

	int whole = (int) n;
	float dec = n - whole;	
	
	int sign;
	int SINGLE_PRECISION = 127;

	float fraction = 0.0f;
	float exp = 1.0f;

	char frac[23] = {'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'};
	char final[32] = {'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'};

	sign = !(n > 0);

	while(fraction < 1.0f)
	{
		fraction = dec / (1.0f/powf(2.0f, exp));
		exp = exp + 1;
	}

	fraction = fraction - 1;
	exp = SINGLE_PRECISION - (exp - 1);

	float fraction_org = fraction;
	int flag = 0;
	int count = 0;	

	while((fraction != fraction_org || flag == 0) && count < 23)
	{
		flag = 1;
		fraction = fraction * 2;
		
		if(fraction > 1)
		{
			frac[count] = '1';
			fraction = fraction - 1;
		}
		else
		{
			frac[count] = '0';
		}			
		count = count + 1;

	}

	char* expBinary = malloc(8);
	expBinary = float2bin(exp);
	
	sprintf(final, "%i%s%s", sign, expBinary, frac);
/*
	printf("sign: %i\n", sign);
	printf("exponent: %f\n", exp);
	printf("exponent: %s\n", expBinary);
	printf("frac: %s\n", frac);
*/
	printf("number: %f\n", n);
	printf("final: %s\n", final);
	
	return 0;
}
