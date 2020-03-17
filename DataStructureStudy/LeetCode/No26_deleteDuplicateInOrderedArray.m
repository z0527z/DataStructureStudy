//
//  No26_deleteDuplicateInOrderedArray.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/17.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No26_deleteDuplicateInOrderedArray.h"

@implementation No26_deleteDuplicateInOrderedArray

- (instancetype)init
{
    if (self = [super init]) {
        // [1,1,2] --> 2, [1, 2, 1]
        int array[] = {0, 0, 1, 1, 1, 2, 2, 3, 3, 4};
        int length = sizeof(array) / sizeof(array[0]);
        printf("\n--------- No26_deleteDuplicateInOrderedArray --------\n\n");
        printArray(array, length, true);
        
        int nLength = deleteDuplicateInOrderedArray(array, length);
        printArray(array, nLength, false);
        
    }
    return self;
}

void printArray(int * array, int length, bool isInput)
{
    printf("%s: %d ==> [", isInput ? "input" : "output", length);
    for (int i = 0; i < length; i ++) {
        i == length -1 ? printf("%d", array[i]) : printf("%d,", array[i]);
    }
    printf("]\n");
}

int deleteDuplicateInOrderedArray(int * array, int length)
{
    if (!array || length <= 0) return 0;
    
    int nLength = 0;
    int * pos = array + 1;
    while (pos < array + length) {
        if (array[nLength] != *pos) {
            nLength++;
            array[nLength] = *pos;
        }
        pos++;
    }
    return nLength + 1;
}

@end
