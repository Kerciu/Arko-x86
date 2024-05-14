#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "func.h"

int main(int argc, char* argv[]){
    if (argc < 4) return -1;

    leaveRange(argv[1], argv[2][0], argv[3][0]);

    printf("%s\n", argv[1]);
    return 0;
}
