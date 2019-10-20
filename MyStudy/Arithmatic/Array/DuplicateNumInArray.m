//
//  DuplicateNumInArray.m
//  MyStudy
//
//  Created by jolin on 2019/10/19.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "DuplicateNumInArray.h"

@implementation DuplicateNumInArray

- (instancetype)init
{
    if (self = [super init]) {
        
        int array[] = {1, 3, 9, 2, 8, 9, 8, 6, 4, 5, 1};
        int length = sizeof(array) / sizeof(array[0]);
        
        int duplicatedNum = -1;
        bool didFind = duplicateNumberInArray(array, 12, &duplicatedNum);
        
        printf("\n------------ DuplicateNumInArray ----------\n\n");
        printf("%s, %d\n", didFind ? "true" : "false", duplicatedNum);
    }
    return self;
}

bool duplicateNumberInArray(int * array, int length, int * duplicatedNum)
{
    if (!array || length < 1) return false;
    
    for (int i = 0; i < length; i ++) {
        if (array[i] < 0 || array[i] >= length) {
            printf("输入的数据 %d 超出范围", array[i]);
            return false;
        }
    }
    
    for (int i = 0; i < length; i ++) {
        while (array[i] != i) {
            
            if (array[i] == array[array[i]]) {
                *duplicatedNum = array[i];
                return true;
            }

            int temp = array[i];
            array[i] = array[temp];
            array[temp] = temp;
        }
    }
    return false;
}

@end
