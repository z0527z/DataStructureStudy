//
//  MergeSort.m
//  MyStudy
//
//  Created by jolin on 2019/10/3.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

- (instancetype)init
{
    if (self = [super init]) {
        int array[] = {5, 9, 1, 9, 5, 3, 7, 6, 1, 17, 20, 3, 7, 8, 11, 30, 18, 34, 68, 29, 35};
        int length = sizeof(array) / sizeof(array[0]);
        
        DJMergeSort(array, length);
        printf("\n------------ MergeSort ------------\n\n");
        for (int index = 0; index < length; index ++) {
            printf("%d ", array[index]);
        }
        printf("\n");
    }
    return self;
}

void DJMergeSort(int * array, int length)
{
    if (!array || length <= 1) return;
    
    int leftLength = length / 2;
    int * left = array;
    int * right = array + length / 2;
    // 不能合并为 length/2, 因为除法用整数接收，存在取整的问题
    int rightLength = length - leftLength;

    DJMergeSort(left, leftLength);
    DJMergeSort(right, rightLength);
    
    DJMerging(left, leftLength, right, rightLength);
}

void DJMerging(int * leftArray, int leftLength, int * rightArray, int rightLength)
{
    int temp[leftLength + rightLength];
    int left = 0;
    int right = 0;
    int tempIndex = 0;

    while (true) {

        if (left < leftLength && right < rightLength) {
            if (leftArray[left] < rightArray[right]) {
                temp[tempIndex++] = leftArray[left++];
            }
            else {
                temp[tempIndex++] = rightArray[right++];
            }
        }

        // 处理剩余数据
        if (left >= leftLength) {
            for (int i = right; i < rightLength; i ++) {
                temp[tempIndex++] = rightArray[i];
            }
            break;
        }
        if (right >= rightLength) {
            for (int i = left; i < leftLength; i ++) {
                temp[tempIndex++] = leftArray[i];
            }
            break;
        }
    }
    // 将临时空间的数据填充到原来的空间
    for (int i = 0; i < leftLength + rightLength; i ++) {
        leftArray[i] = temp[i];
    }
}


@end
