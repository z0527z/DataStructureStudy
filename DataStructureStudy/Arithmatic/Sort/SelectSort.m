//
//  SelectSort.m
//  MyStudy
//
//  Created by jolin on 2019/10/4.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "SelectSort.h"

@implementation SelectSort

- (instancetype)init
{
    if (self = [super init]) {
        int array[] = {2, 1, 3, 7, 9, 29, 99, 78, 28, 12, 34, 1, 39, 3, 8, 6};
        int length = sizeof(array) / sizeof(array[0]);
        DJSelectSort(array, length);
        
        printf("\n------------- SelectSort ------------\n\n");
        for (int index = 0; index < length; index ++) {
            printf("%d ", array[index]);
        }
        printf("\n");
    }
    return self;
}

/**
 * 快 希 选 堆 （均为不稳定）
 *
 * 不稳定的算法（相同元素原来的顺序不能维持）
 *
 * 时间复杂度：平均 O(n²)        最坏 O(n²)         最好 O(n²)         空间复杂度 O(1)
 */
void DJSelectSort(int * array, int length)
{
    if (!array || length <= 1) return;
    
    for (int i = 0; i < length; i ++) {
        for (int j = i + 1; j < length; j ++) {
            if (array[j] < array[i]) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
}

@end
