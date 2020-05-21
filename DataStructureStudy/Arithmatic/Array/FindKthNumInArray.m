//
//  FindKthNumInArray.m
//  DataStructureStudy
//
//  Created by jolin on 2020/5/20.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "FindKthNumInArray.h"

@implementation FindKthNumInArray

- (instancetype)init
{
    if (self = [super init]) {
        getInputFromConsole();
    }
    return self;
}

void getInputFromConsole(void)
{
    // 接收控制台输入
    int arrayLength = 0, k = 0;
    puts("\n请输入数组的长度和k的大小:");
    scanf("%d %d", &arrayLength, &k);
    if (arrayLength <= 0 || k <= 0 || k >= arrayLength) return;
    
    int * array = malloc(sizeof(int) * arrayLength);
    
    scanf("%d %d %d %d %d", array, array + 1, array + 2, array + 3, array + 4);
    
    findAllNumsToKByAscendingOrderInUnsortedArray(array, 0, arrayLength - 1);
    
    for (int i = 0; i < k; i ++) {
        printf("%d", array[i]);
    }
    
    if (arrayLength >= 10) {
        free(array);
    }
}

void findAllNumsToKByAscendingOrderInUnsortedArray(int * array, int start, int end)
{
    if (!array || start < 0 || end < 1 || start >= end) return;
    
    // 交换中间位置和节点
    int mid = (start + end) / 2;
    int temp = array[mid];
    array[mid] = array[start];
    array[start] = temp;
    
    int jie = array[start];
    int l = start;
    int r = end;
    
    while (l < r) {
        while (l < r && array[r] >= jie) {
            r--;
        }
        if (l < r) {
            array[l] = array[r];
            l++;
        }
        while (l < r && array[l] <= jie) {
            l++;
        }
        if (l < r) {
            array[r] = array[l];
            r--;
        }
        
        // 交换节点和左指针的位置
        array[l] = jie;

        findAllNumsToKByAscendingOrderInUnsortedArray(array, start, l - 1);
        findAllNumsToKByAscendingOrderInUnsortedArray(array, l+1, end);
    }
}

int partition(int * array, int start, int end)
{
    return 0;
}



@end
