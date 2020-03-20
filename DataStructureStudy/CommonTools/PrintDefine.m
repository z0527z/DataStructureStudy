//
//  PrintDefine.c
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/20.
//  Copyright © 2020 jolin. All rights reserved.
//

#include "PrintDefine.h"

void printArray(int * array, int size)
{
    if (!array || size <= 0) {
        printf(" [] ");
        return;
    }
    printf(" [");
    for (int i = 0; i < size; i ++) {
        i == size -1 ? printf("%d", array[i]) : printf("%d,", array[i]);
    }
    printf("] ");
}
