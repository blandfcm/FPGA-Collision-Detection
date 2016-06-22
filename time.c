#include <sys/time.h>
#include <stdio.h>
#include <unistd.h>
#include <time.h>

int main()
{
	struct timespec tps, tpe;
	clock_gettime(CLOCK_REALTIME, &tps);
	usleep(2000);// test to make sure it was accurate	
	clock_gettime(CLOCK_REALTIME, &tpe);
	printf("%lu ns\n", tpe.tv_nsec-tps.tv_nsec);
	return 0;
}
