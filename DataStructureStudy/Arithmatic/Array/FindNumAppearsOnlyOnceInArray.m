//
//  FindNumAppearsOnlyOnceInArray.m
//  DataStructureStudy
//
//  Created by jolin on 2021/3/21.
//  Copyright © 2021年 jolin. All rights reserved.
//

#import "FindNumAppearsOnlyOnceInArray.h"

@implementation FindNumAppearsOnlyOnceInArray

- (instancetype)init {
    if (self = [super init]) {
        
        printf("\n---------- FindNumAppearsOnlyOnceInArray ---------\n\n");
        
        testOneNum();
        testTwoNums();
    }
    return self;
}


void testOneNum() {
    int array[] = {3, 5, 7, 6, 5, 3, 7};
    int length = sizeof(array) / sizeof(array[0]);
    
    int num = findNumAppearsOnlyOnceInArray(array, length);
    printf("num:%d\n", num);
}

/**
 * 一个数组中只有一个数出现了一次，其他数都出现了两次；找出这个数
 * 要求：不借助任何空间，空间复杂度O(1)
 */
int findNumAppearsOnlyOnceInArray(int * array, int length) {
    if (!array || length < 1) return -1;
    
    int num = 0;
    for (int i = 0; i < length; i ++) {
        num ^= array[i];
    }
    return num;
}


void testTwoNums() {
    int array[] = {3, 5, 7, 6, 5, 3};
    int length = sizeof(array) / sizeof(array[0]);
    
    int x;
    int y;
    findNumsAppearsOnlyOnceInArray(array, length, &x, &y);
    printf("x:%d, y:%d\n", x, y);
}
/**
 * 一个数组中只有两个数字是出现一次，其他所有数字都出现了两次。找出这两个只出现一次的数字
 */
void findNumsAppearsOnlyOnceInArray(int * array, int length, int * x, int * y) {
    if (!array || length < 1) return;
    // 整体异或的结果，存放到了num
    int num = findNumAppearsOnlyOnceInArray(array, length);
    int pos = 0;
    
    // 把数组中所有的元素分组
    for (int i = 0; i < sizeof(int) * 8; i ++) {
        if (((num >> i) & 1) == 1) {
            pos = i;
            break;
        }
    }
    
    // 分组异或
    for (int i = 0; i < length; i ++) {
        if (((array[i] >> pos) & 1) == 1) {
            *x ^= array[i];
        }
        else {
            *y ^= array[i];
        }
    }
}

@end
