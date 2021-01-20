//
//  No53_MaxSubsequenceSum.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/6.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "No53_MaxSubsequenceSum.h"

@implementation No53_MaxSubsequenceSum

- (instancetype)init {
    if (self = [super init]) {
        int array[] = {-2, 1, -3, 4, -1, 2, 1, -5, 4};
        int length = sizeof(array) / sizeof(array[0]);
        
        int maxSum = maxSubsequenceSumOfDynamic(array, length);
        printf("\n---------- maxSubsequenceSumOfArray ---------\n\n");
        printf("maxSum: %d\n", maxSum);
    }
    return self;
}

#pragma mark - 贪心算法
/**
 * 任何一个最大子序列和，它的第一位都不会是负数。结合贪心算法的定义，
 * 当currentSum小于零时，即使加上后面的数也不会是最大子序列和（不如直接不要当前的currentSum），
 * 所以直接将currentSum设为0，重新开始计算新的子序列和
 */
int maxSubsequenceSumOfGreedy(int * array, int length) {
    if (!array || length < 1) return 0;
    
    int maxSum = 0;
    int currentSum = 0;
    for (int i = 0; i < length; i ++) {
        currentSum += array[i];
        if (currentSum > maxSum) {
            maxSum = currentSum;
        }
        if (currentSum < 0) {
            currentSum = 0;
        }
    }
    return maxSum;
}


#pragma mark - 动态规划
/**
 * 公式:   ∑array[i] = MAX( ∑array[i - 1] + array[i] ,   array[i])
 */
int maxSubsequenceSumOfDynamic(int * array, int length) {
    if (!array || length < 1) return 0;
    
    int pre = 0;
    int maxSum = array[0];
    
    for (int i = 0; i < length; i ++) {
        /** 取 "前面和" 与 "当前值" 比较的最大值
         *  相当于 pre <  0 是 设置 pre = 0 与贪心算法异曲同工
         */
        pre = MAX(pre + array[i], array[i]);
        maxSum = MAX(pre, maxSum);
    }
    return maxSum;
}

@end
