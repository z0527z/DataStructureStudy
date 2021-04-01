//
//  FindKthNumInArray.m
//  DataStructureStudy
//
//  Created by jolin on 2020/5/20.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "FindKthNumInArray.h"
#import "PrintDefine.h"

@implementation FindKthNumInArray

- (instancetype)init
{
    if (self = [super init]) {

        int array[] = {1, 3, 8, 7, 9, 18, 5, 9};
        int length = sizeof(array) / sizeof(array[0]);
        int k = 4;
        
        int result = findAllNumsToKByAscendingOrderInUnsortedArray(array, 0, length - 1, k - 1);
        printf("\n------------ FindKthNumInArray ----------\n\n");
        printf("result:%d\n", result);
        
    }
    return self;
}

int partition(int * array, int start, int end) {
    int pivot = array[start];
    
    while (start < end) {
        while (start < end && array[end] >= pivot) {
            end --;
        }
        array[start] = array[end];
        
        while (start < end && array[start] <= pivot) {
            start ++;
        }
        array[end] = array[start];
    }
    array[start] = pivot;
    
    return start;
}

/**
 * 采用二分法查找K值
 */
int findAllNumsToKByAscendingOrderInUnsortedArray(int * array, int start, int end, int k)
{
    if (!array || start < 0 || end < 1 || start > end) return 0;
    
    int pos = partition(array, start, end);
    if (k == pos) {
        return array[k];
    }
    else if (k > pos) {
        return findAllNumsToKByAscendingOrderInUnsortedArray(array, pos + 1, end, k);
    }
    else {
        return findAllNumsToKByAscendingOrderInUnsortedArray(array, start, pos - 1, k);
    }
}

/**
 * 采用小顶堆查找K值
 */
int findAllNumsToKthByAscendingOrder(int * array, int length, int k)
{
    if (!array || length <= k || k < 0 || length <= 0) return 0;
    // 构造小顶堆
    for (int i = (length - 1) / 2; i >= 0; i --) {
        heapify(array, i, length - 1);
    }
    // 交换堆顶和第一个元素，堆高度 -1
    for (int i = length - 1; i > 0; i --) {
        int temp = array[i];
        array[i] = array[0];
        array[0] = temp;
        
        heapify(array, 0, i - 1);
    }
    
    return array[k];
}

void heapify(int * array, int start, int end)
{
    int dad = start;
    int son = 2 * dad + 1;
    while (son <= end) {
        if (son + 1 <= end && array[son] < array[son + 1]) {
            son ++;
        }
        if (array[son] <= array[dad]) {
            return;
        }
        else {
            int temp = array[son];
            array[son] = array[dad];
            array[dad] = temp;
            
            dad = son;
            son = 2 * dad + 1;
        }
    }
}

/**
 * 选择排序，选出 length - k 个大的数放在右边，则左边的 k 个数就是最小的前 k 个
 */
int findAllTopKthInUnsortedArray(int * array, int length, int k)
{
    if (!array || length <= 0 || k < 0 || k >= length) return 0;
    
    for (int i = length - 1; i >= k; i --) {
        for (int j = i - 1; j >= 0; j --) {
            if (array[i] < array[j]) {
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    return array[k];
}

@end
