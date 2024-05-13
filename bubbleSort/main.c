#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "func.h"

int main(int argc, char* argv[]){
    if (argc < 2) return -1;
    bubbleSort(argv[1]);

    printf("%s\n", argv[1]);
    return 0;
}
