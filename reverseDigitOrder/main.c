#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "func.h"


int main(int argc, char* argv[]){

    if(argc<2){
        printf("Not enough arguments.\n");
        return -1;
    }

    reversedig(argv[1]);

    printf("Modified text: %s\n", argv[1]);

    return 0;
}