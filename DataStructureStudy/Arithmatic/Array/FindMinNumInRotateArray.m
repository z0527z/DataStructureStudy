//
//  FindMinNumInRotateArray.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/3.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "FindMinNumInRotateArray.h"

@implementation FindMinNumInRotateArray

- (instancetype)init {
    if (self = [super init]) {
        int array[] = {1, 0, 1, 1, 1}; //{3, 4, 5, 1, 2}
        int length = sizeof(array) / sizeof(array[0]);
        int * minNum = findMinNumInRotateArray(array, length);
        printf("\n---------- findMinNumInRotateArray ---------\n\n");
        if (minNum) {
            printf("%d\n", *minNum);
            free(minNum);
        }
        
    }
    return self;
}

/**
 * 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
 * 输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。
 * 例如，数组 {3, 4, 5, 1, 2} 为 {1, 2, 3, 4, 5}的一个旋转，该数组的最小值为1
 */
int * findMinNumInRotateArray(int * array, int length) {
    if (!array || length < 1) return NULL;
    
    int * minNum = malloc(sizeof(int));
    *minNum = array[0];
    for (int i = 1; i < length; i ++) {
        if (array[i] < array[i - 1]) {
            *minNum = array[i];
        }
    }
    return minNum;
}

@end
