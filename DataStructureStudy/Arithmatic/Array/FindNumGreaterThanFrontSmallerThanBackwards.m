//
//  FindNumGreaterThanFrontSmallerThanBackwards.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/3/18.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "FindNumGreaterThanFrontSmallerThanBackwards.h"

@implementation FindNumGreaterThanFrontSmallerThanBackwards

- (instancetype)init {
    if (self = [super init]) {

        int array[] = {21, 11, 5, 34, 7, 66, 69, 67, 101, 100};
        int length = sizeof(array) / sizeof(array[0]);
        
        int returnSize = 0;
        int * result = findNumGreaterThanFrontSmallerThanBackwards(array, length, &returnSize);
        printf("\n---------- FindNumGreaterThanFrontSmallerThanBackwards ---------\n\n");
        if (returnSize != 0 && result) {
            for (int i = 0; i < returnSize; i ++) {
                printf("%d ", result[i]);
            }
            printf("\n");
            free(result);
        }
        
    }
    return self;
}

/**
 * O(n)时间，O(n)空间范围内找出比前面大比后面小的数
 */
int * findNumGreaterThanFrontSmallerThanBackwards(int * array, int length, int * returnSize) {
    if (!array || length <= 3) return NULL;
    
    int * dict = (int *)malloc(sizeof(int) * length);
    if (!dict) return NULL;
    
    memset(dict, 0, length);
    
    // 从左往右遍历，记录最大值，然后更新每个位置的最大值
    int bigValue = array[0];
    for (int i = 1; i < length; i ++) {
        if (array[i] > bigValue) {
            bigValue = array[i];
        }
        dict[i] = bigValue;
    }
    
    int * result = (int *)malloc(sizeof(int) * length);
    // 从右往左遍历，记录最小值，对每个最小值判断其所在位置(i)的值是否大于其左边(i - 1)位置的最大值
    int smallValue = array[length - 1];
    for (int i = length - 2; i >= 0; i --) {
        int value = array[i];
        if (value < smallValue) {
            smallValue = value;
            if (smallValue > dict[i - 1]) {
                result[(*returnSize)++] = smallValue;
            }
        }
    }
    free(dict);
    return result;
}

@end
