#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "func.h"

int main(int argc, char* argv[]){
    if (argc < 3) return -1;

    int n = atoi(argv[2]);
    printf("Inside func: %s %d\n", argv[1], n);

    leaveLastNdigits(argv[1], n);

    printf("%s\n", argv[1]);
    return 0;
}
