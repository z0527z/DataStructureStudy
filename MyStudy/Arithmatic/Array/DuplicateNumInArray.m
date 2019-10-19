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
        int * p = duplicateNumberInArray(array, 12);
        
        printf("\n------------ DuplicateNumInArray ----------\n\n");
        while (p) {
            printf("%d ", *p);
            p++;
        }
        printf("\n");
    }
    return self;
}

int * duplicateNumberInArray(int * array, int length)
{
    if (!array || length < 1) return NULL;
    
    for (int i = 0; i < length; i ++) {
        if (array[i] < 0 || array[i] >= length) {
            printf("输入的数据 %d 超出范围", array[i]);
            return NULL;
        }
    }
    
    int * tempArray = malloc(sizeof(int) * length);
    memset(tempArray, 0, length);
    int j = 0;
    for (int i = 0; i < length; i ++) {
        while (array[i] != i) {
            
            if (array[i] == array[array[i]]) {
                tempArray[j++] = array[i];
                return tempArray;
            }

            int temp = array[i];
            array[i] = array[temp];
            array[temp] = temp;
        }
    }
    return tempArray;
}

@end
