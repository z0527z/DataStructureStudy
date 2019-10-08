//
//  ReorderOddEven.m
//  MyStudy
//
//  Created by jolin.ding on 2019/10/8.
//  Copyright © 2019 jolin. All rights reserved.
//

#import "ReorderOddEven.h"

@implementation ReorderOddEven

- (instancetype)init
{
    if (self = [super init]) {
        
        int array[] = {2, 3, 1, 7, 9, 99, 2, 4, 5, 9, 92, 37};
        int length = sizeof(array) / sizeof(array[0]);
        reorderOddEven(array, length, isOdd);
        
        printf("\n----------- ReorderOddEven ----------\n\n");
        for (int index = 0; index < length; index ++) {
            printf("%d ", array[index]);
        }
        printf("\n");
        
    }
    return self;
}

/// 面试题14: 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分
///          所有偶数位于数组的后半部分
/// @param array 用于调整的数组
/// @param length 该数组的长度
/// @param func 用于判定规则的函数指针
void reorderOddEven(int * array, int length, int (*func)(int value))
{
    if (!array || length <= 1) return;
    
    int left = 0;
    int right = length - 1;
    
    // 逻辑同快排
    while (left < right) {
        while (left < right && !func(array[right])) {
            right --;
        }
        while (left < right && func(array[left])) {
            left ++;
        }
        
        if (left < right) {
            int temp = array[left];
            array[left] = array[right];
            array[right] = temp;
        }
    }
    
}

int isEven(int value)
{
    return (value & 0x01) == 0;
}


/// 判断输入值是否是奇数，& 运算效率高于 %
/// @param value 输入值
int isOdd(int value)
{
    return (value & 0x01) == 1;
}

@end
