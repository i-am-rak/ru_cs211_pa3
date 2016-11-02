#include "nCr.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


int main(int argc, char ** argv){
    printf("%d\n", Factorial(atoi(argv[1])));
    printf("%d\n", nCr(atoi(argv[1]), atoi(argv[2])));
    return 0;
}
