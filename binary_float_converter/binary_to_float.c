#include <stdio.h>
#include <stdlib.h>
#include <string.h>

float powf(float x, float y)
{
	float res = 1.0f;
	int flag = 0;	
	if(y < 0)
	{
		y = -y;
		flag = 1;
	}

	while(y > 0)
	{
		res = res * x;
		y--;
	}

	if(flag == 1)
	{
		res = 1/res;
	}
	return res;
}

float bin2float(char *binString)
{
	int count = 0;
	int place = 0;

	int i;
	for(i = 7; i >= 0; i = i - 1)
	{
		if(binString[i] == '1')
		{
			count = count + powf(2.0f, place);
		}	
		place = place + 1;
	}
	return count;
}

int getSign(char *num)
{
	if(num[0] == '0')
	{
		return(1);
	}
	else
	{
		return(-1);
	}
}

int getExponent(char *num)
{
	int BIAS = 127;
	return bin2float(num) - BIAS;
}

float getFraction(char *num)
{
	float res = 0;

	int i;
	for(i = 1; i < 24; i = i + 1)
	{
		if(num[i-1] == '1')
		{
			res = res + (1/powf(2.0f, i));
		}	
	}
	return res + 1;
}
	
int main()
{
	char allZero[33] = {'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','\0'};
	char negZero[33] = {'1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','\0'};

	char* n = malloc(32);
	char* exp = malloc(8);
	char* frac = malloc(23);
	
	int sign;
	int whole;
	
	float dec;	
	float final;

	printf("Enter a binary string:\n");
	scanf("%s", n);

	if(strcmp(n, allZero) == 0 || strcmp(n, negZero) == 0)
	{
		final = 0.0f;
		printf("final: %f\n", final);
		return 0;
	}
	
	memcpy(exp, &n[1], 8);
	memcpy(frac, &n[9], 23);

	sign = getSign(n);
	whole = getExponent(exp);
	dec = getFraction(frac);
	final = sign * powf(2.0f, whole) * dec;	

	printf("final: %f\n", final);
	
	return 0;
}
