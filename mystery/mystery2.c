/*
 * Mystery.c
 * Fibonacci Series
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


int num[200]; //Contains the first 200 numbers of fibonacci

int add(int a1, int a2){

    return a1 + a2;
}

int dothething(int n){
    int temp;
    if(num[n] == -1){
        if(n == 0){
            temp = 0;
        }
        else if(n == 1){
            temp = 1;
        }
        else{
            temp = add(dothething(n-2),dothething(n-1));
        }
        if(num[n] == -1){
            num[n] = temp;
        }
    }
    
    return num[n];
}

int main(int argc, char ** argv){
    
    int n = atoi(argv[1]);
    
    int i = 0;
    for(i = 0; i <= 199; i++){
        num[i] = -1;
    }

    printf("Value:  %d\n",dothething(n));
                    
    return 0;
}
