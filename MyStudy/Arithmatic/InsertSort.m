
//
//  InsertSort.m
//  MyStudy
//
//  Created by jolin on 2019/10/4.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "InsertSort.h"

@implementation InsertSort

- (instancetype)init
{
    if (self = [super init]) {
        int array[] = {1, 3, 2, 9, 27, 9, 1, 23, 25, 39, 99, 29, 22, 33, 87, 91, 5};
        int length = sizeof(array) / sizeof(array[0]);
        
        insertSort(array, length);
        
        printf("\n------------- InsertSort ------------\n\n");
        for (int index = 0; index < length; index ++) {
            printf("%d ", array[index]);
        }
        printf("\n");
    }
    return self;
}

void insertSort(int * array, int length)
{
    if (!array || length <= 1) return;
    
    for (int i = 1; i < length; i ++) {
        int value = array[i];
        int j = i;
        // 如果当前值比已经排序序列中的数小，则将对应的数字右移，直到找到条件不成立的
        while (j > 0 && array[j - 1] > value) {
            array[j] = array[j - 1];
            j --;
        }
        
        if (j != i) {
            array[j] = value;
        }
    }
}

@end
