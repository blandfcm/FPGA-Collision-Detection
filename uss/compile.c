#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main()
{
 
	FILE *fp = fopen("compile2.txt", "r");

        fseek(fp, 0, SEEK_END);
        long fsize = ftell(fp);
        fseek(fp, 0, SEEK_SET);

        char *whole = malloc(fsize + 1);
        fread(whole, fsize, 1, fp);
        fclose(fp);

        whole[fsize] = 0;
	system(whole);

//	char command[100];
//	strcpy(command, "./uss_test");
//	system(command);
//	strcpy(command, "./uss_test2");
//	system(command);
	return 0;
}
