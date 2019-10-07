//
//  HeapSort.m
//  MyStudy
//
//  Created by jolin on 2019/10/2.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "HeapSort.h"

@implementation HeapSort

- (instancetype)init
{
    if (self = [super init]) {
        int array[] = {3, 7, 1, 2, 8, 9, 1, 9, 2, 5, 6, 4, 12, 30};
        int length = sizeof(array) / sizeof(array[0]);
        DJHeapSort(array, 0, length - 1);
        
        printf("\n------------- heapSort --------------\n\n");
        for (int index = 0; index < length; index ++) {
            printf("%d ", array[index]);
        }
        printf("\n");
    }
    return self;
}


void DJHeapSort(int * array, int begin, int end)
{
    if (!array || begin < 0 || begin >= end || end < 1) return;
    
    // 构建堆
    for (int i = (end - begin) / 2 ; i >= begin; i --) {
        maxHeapify(array, i, end);
//        minHeapify(array, i, end);
    }
    
    // 交换堆顶和最后一个元素的位置
    for (int i = end; i > begin; i --) {
        int temp = array[i];
        array[i] = array[begin];
        array[begin] = temp;
        
        maxHeapify(array, begin, i - 1);
//        minHeapify(array, begin, i - 1);
    }
}

#pragma mark - 大顶堆

/**
 构建大顶堆，大顶堆要求: 每个节点的值都大于或等于其左右孩子节点的值

 @param array 构造堆得数据
 @param begin 父节点
 @param end 结束的位置
 */
void maxHeapify(int * array, int begin, int end)
{
    int dad = begin;
    // 构建堆的左子节点
    int son = 2 * dad + 1;
    // 逐渐去找左右孩子结点
    while (son <= end) {
        // 找到两个孩子结点中值大的
        if (son + 1 <= end && array[son] < array[son + 1]) {
            son ++;
        }
        //父节点和最大值得孩子节点进行比较
        if (array[dad] >= array[son]) {
            return;
        }
        else { // 不满足最大堆的条件，所以需要交换
            int temp = array[son];
            array[son] = array[dad];
            array[dad] = temp;
            
            dad = son;
            son = 2 * dad + 1;
        }
    }
}

#pragma mark - 小顶堆
void minHeapify(int * array, int begin, int end)
{
    int dad = begin;
    int son = 2 * dad + 1;
    
    while (son <= end) {
        if (son + 1 <= end && array[son] > array[son + 1]) {
            son ++;
        }
        if (array[dad] <= array[son]) {
            return;
        }
        else {
            int temp = array[dad];
            array[dad] = array[son];
            array[son] = temp;
            
            dad = son;
            son = dad * 2 + 1;
        }
    }
}

@end
