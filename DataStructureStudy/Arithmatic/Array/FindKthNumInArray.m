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
    
    // 处理从控制台输入参数问题
    getchar();
    int * p = array;
    char c;
    do {
        c = getchar();
        if (c != '\n' && c != ' ') {
            *p = c - '0';
            p++;
        }
    } while (c != '\n' || (p - array) < k);

    
//    int kthNum = findAllNumsToKByAscendingOrderInUnsortedArray(array, 0, arrayLength - 1, k - 1);
//    int kthNum = findAllNumsToKthByAscendingOrder(array, arrayLength, k - 1);
    int kthNum = findAllTopKthInUnsortedArray(array, arrayLength, k - 1);
    printf("k:%d, Kth:%d", k, kthNum);
    
    printf("\narray: ");
    for (int i = 0; i < arrayLength; i ++) {
        printf("%d", array[i]);
    }
    
    if (arrayLength >= 10) {
        free(array);
    }
}

/**
 * 采用二分法查找K值
 */
int findAllNumsToKByAscendingOrderInUnsortedArray(int * array, int start, int end, int k)
{
    if (!array || start < 0 || end < 1 || start >= end || k > end || k < start) return 0;
    // 交换中间位置和节点
    int mid = (start + end) / 2;
    int temp = array[mid];
    array[mid] = array[start];
    array[start] = temp;
    
    int jie = array[start];
    int l = start;
    int r = end;
    while (l < r) {
        // 从右边开始找到比节点小的数
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
        
        // 判断 k 在哪个区间范围内
        if (k < l) {
            return findAllNumsToKByAscendingOrderInUnsortedArray(array, start, l - 1, k);;
        }
        else if (k > l) {
            return findAllNumsToKByAscendingOrderInUnsortedArray(array, l+1, end, k);;
        }
    }
    return array[l];
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
