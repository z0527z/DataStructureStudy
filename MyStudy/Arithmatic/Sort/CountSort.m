//
//  CountSort.m
//  MyStudy
//
//  Created by jolin on 2019/10/25.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "CountSort.h"

@implementation CountSort

- (instancetype)init
{
    if (self = [super init]) {
        
        int array[] = {-1, 8, 2, 9, 1, 9, 2, 7, 6, 5, 9, 9};
        int length = sizeof(array) / sizeof(array[0]);
        countSort(array, length);
        
        printf("\n-------------- CountSort -------------\n\n");
        for (int i = 0; i < length; i ++) {
            printf("%d ", array[i]);
        }
        printf("\n");
        
    }
    return self;
}

void countSort(int * array, int length)
{
    if (!array || length < 1) return;
    
    int maxValue = INT_MIN;
    int minValue = INT_MAX;
    for (int i = 0; i < length; i ++) {
        maxValue = MAX(maxValue, array[i]);
        minValue = MIN(minValue, array[i]);
    }
    
    // 申请用于计数的空间, 并初始化
    int result[length];
    int counting[maxValue - minValue + 1];
    for (int i = minValue; i <= maxValue; i ++) {
        counting[i - minValue] = 0;
    }
    
    // 统计各元素的数量
    for (int i = 0; i < length; i ++) {
        int num = array[i];
        counting[num - minValue]++;
    }
    
    // 根据前面的元素更新对应的计数
    for (int i = minValue + 1; i <= maxValue; i ++) {
        counting[i - minValue] += counting[i - 1 - minValue];
    }
    
    for (int i = 0; i < length; i ++) {
        int num = array[i];
        int index = counting[num - minValue] - 1;
        result[index] = num;
        counting[num - minValue]--;
    }
    
    for (int i = 0; i < length; i ++) {
        array[i] = result[i];
    }
}

@end
