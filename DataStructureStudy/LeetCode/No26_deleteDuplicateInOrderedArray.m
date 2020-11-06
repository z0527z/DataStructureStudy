//
//  No26_deleteDuplicateInOrderedArray.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/17.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No26_deleteDuplicateInOrderedArray.h"
#import "PrintDefine.h"

@implementation No26_deleteDuplicateInOrderedArray

- (instancetype)init
{
    if (self = [super init]) {
        // [1,1,2] --> 2, [1, 2, 2]
        int array[] = {0, 0, 1, 1, 1, 2, 2, 3, 3, 4};
        int length = sizeof(array) / sizeof(array[0]);
        printf("\n--------- No26_deleteDuplicateInOrderedArray --------\n\n");
        printf("input:  ");
        printArray(array, length);
        printf("===> %d\n", length);
        int nLength = deleteDuplicateInOrderedArray(array, length);
        printf("output: ");
        printArray(array, nLength);
        printf("===> %d\n", nLength);
        
    }
    return self;
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
