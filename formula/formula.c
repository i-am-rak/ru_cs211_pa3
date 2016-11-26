#include "nCr.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>

int main(int argc, char ** argv){

    struct timeval start, end; // declare timeval type variables start and end 
    gettimeofday(&start, NULL); //get start time

    int x = atoi(argv[1]);    
    if(argv[1][0] == '-' && argv[1][1] == 'h'){
        fprintf(stdout,"Usage: formula <positive integer>\n");
        return 0;
    }

    int j = 0;
    int isNotNum = 0;
    for(j = 0; j < strlen(argv[1]); j++){
        if(!isdigit(argv[1][j])){
            isNotNum = 1;
            break;
        }
    }

    if((x < 0) || (isNotNum)){
        fprintf(stderr,"ERROR: Expected non-negative integer\n");
        return 0;
    }
    else if(x == 0){
        fprintf(stdout,"(1+x)^0 = 1\n");
        return 0;
    }
    else if(nCr(x,x/2) == 0){
        fprintf(stderr,"ERROR: Integer overflow occured\n");
        return 0;
    }
    else{
        fprintf(stdout,"(1+x)^%s = 1 ", argv[1]);
        int i = 0;
        for(i = 1; i <= atoi(argv[1]); i++){
            fprintf(stdout,"+ %d*x^%d", nCr(atoi(argv[1]),i), i);
        }
        fprintf(stdout,"\n");
    }

    gettimeofday(&end, NULL); //get end time
    /* subtract start time from end time and print them in microseconds. */
    printf("Time is %ld microseconds\n", ((end.tv_sec * 1000000 + end.tv_usec) - (start.tv_sec * 1000000 + start.tv_usec)));

    return 0;
}
