//
//  Fish.c
//  Shark
//
//  Created by rykeryin on 2020/11/14.
//

#include "Fish.h"

int fishSuccess(int a) {
    printf("\n===============\n fish success \n===============\n");
    return 1;
}

int fishFail() {
    printf("\n===============\n fish fail \n===============\n");
    return -1;
}

int fishing(int food) {
    printf("\n===============\n fish \n===============\n");
    return food > 10 ? fishSuccess(1): fishFail();
}
