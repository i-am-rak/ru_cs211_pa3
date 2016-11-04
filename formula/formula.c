#include "nCr.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


int main(int argc, char ** argv){

   /*( if((atoi(argv[1]) < 1) || (atoi(argv[2]) < 1)){
        printf("Number must be greater than 1\n");
        return 0;
    }
*/

    printf("%d\n", Factorial(atoi(argv[1])));
    printf("%d\n", nCr(atoi(argv[1]), atoi(argv[2])));
    return 0;
}
