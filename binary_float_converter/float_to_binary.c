#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

	float fraction = dec;
	float exp = 1.0f;
	float exp1 = 1.0f;
	float exp2 = 1.0f;

	char* frac = malloc(16);
	char* final = malloc(32);

	sign = !(n > 0);

	char* expBinaryG = malloc(8);
	char* expBinary = malloc(8);
	
	expBinaryG = float2bin((float)whole);

	int j = 0;	
	while(expBinaryG[j] == '0')
	{
		j = j + 1;
	}	
	exp1 = 8 - j - 1;
	
	if(dec > 0)
	{
		while(fraction < 1.0f && fraction < 2.0f)
		{
			fraction = dec / (1.0f/powf(2.0f, exp2));
			exp2 = exp2 + 1;
		}
		exp2 = exp2 -1;
	}

	if(whole > 0)
	{
		exp = exp1 + SINGLE_PRECISION;
	}
	else
	{
		exp = (-1)*exp2 + SINGLE_PRECISION;
	}	

	expBinary = float2bin(exp);

	//fraction = fraction - 1;
	if(whole > 0)
	{
		fraction = dec;
	}
	else
	{
		fraction = fraction - 1;
	}
	float fraction_org = fraction;
	int flag = 0;
	int count = 0;	

	//while((fraction != fraction_org || flag == 0) && count < 16)
	while(count < 23)
	{
		flag = 1;
		fraction = fraction * 2;
		
		if(fraction > 1)
		{
			frac[count] = '1';
			fraction = fraction - 1;
		}
		else if(fraction < 1)
		{
			frac[count] = '0';
		}	
		else
		{	
			frac[count] = '1';
			count = count + 1;
			break;
		}		
	
		count = count + 1;
	}

	char wholePt[8];	
	if(whole > 0)	
	{
		char* pt1 = malloc(8);
		pt1 = float2bin(whole);

		j = 0;
		while(pt1[j] == '0')
		{
			j = j + 1;
		}	
		int offset = j+1;
		strcpy(wholePt, &pt1[j+1]);

		count = count + 8 - offset;	
	}

	char* zero = malloc(23);
	int k;
	int place = 0;
	for(k = count; k < 23; k = k + 1)
	{
		zero[place] = '0';
		place = place + 1;
	}  

	char* mantissa = malloc(32);	
	if(whole > 0)
	{
		sprintf(mantissa, "%s%s%s", wholePt, frac, zero);
	}
	else
	{	
		sprintf(mantissa, "%s%s", frac, zero);
	}
	sprintf(final, "%i%s%s", sign, expBinary, mantissa);

	printf("final: %s\n", final);
	
	return 0;
}
