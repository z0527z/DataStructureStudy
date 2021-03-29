//
//  QuickSort.m
//  MyStudy
//
//  Created by jolin on 2019/10/2.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

- (instancetype)init
{
    if (self = [super init]) {
        
        int array[] = {3, 5, 1, 7, 9, 20, 2, 8, 6, 9, 12, 1, 1, 16};
        int length = sizeof(array) / sizeof(array[0]);
        
        quickSort(array, 0, length - 1);
        
        printf("\n------------ QuickSort --------------\n\n");
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
 * 时间复杂度：平均 O(nlog₂n)        最坏 O(n²)         最好 O(nlog₂n)         空间复杂度 O(log₂n)
 */
void quickSort(int * array, int begin, int end)
{
    if (!array || begin < 0 || end < 1 || begin >= end) return;

    // 交换 begin和 (begin + end)/2 位置的数据
    int temp = array[begin];
    array[begin] = array[(begin + end) / 2];
    array[(begin + end) / 2] = temp;
    
    // 取begin位置的数为节点
    int jie = array[begin];
    int left = begin;
    int right = end;
    
    while (left < right) {
        // 从右边开始找比节点小的数位置
        while (left < right && array[right] >= jie) {
            right --;
        }
        // 将该数移到节点的左边
        if (left < right) {
            array[left] = array[right];
            left ++;
        }
        // 从左边开始找比节点大的数位置
        while (left < right && array[left] <= jie) {
            left ++;
        }
        // 将该数移到节点的右边
        if (left < right) {
            array[right] = array[left];
            right --;
        }
        // 将节点交换到中间
        array[left] = jie;
    }
    
    // 左右分别进行递归
    quickSort(array, begin, left - 1);
    quickSort(array, left + 1, end);

}

@end
