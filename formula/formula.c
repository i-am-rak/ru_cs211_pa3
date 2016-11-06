#include "nCr.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main(int argc, char ** argv){
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
    return 0;
}
