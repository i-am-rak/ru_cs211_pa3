/*
 * Mystery.c
 * Fibonacci Series
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int add(int a1, int a2){

    return a1 + a2;
}

int dothething(int n){
    
    int first = 1;
    int second = 1;
    int next = 0;
    int i;
    for (i = 0;i < n;i++){
        if ( i <= 1)
            next = 1;
        else {
            next = first + second;
            first = second;
            second = next;
        }
     //   printf("%d\n",next);
    }
    return next;

}

int main(int argc, char ** argv){
    
    int n = atoi(argv[1]);
    
    printf("Value:  %d\n",dothething(n));
                    
    return 0;
}
