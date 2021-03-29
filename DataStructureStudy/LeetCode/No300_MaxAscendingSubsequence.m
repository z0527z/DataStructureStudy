//
//  No300_MaxAscendingSubsequence.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/6.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "No300_MaxAscendingSubsequence.h"

@implementation No300_MaxAscendingSubsequence

- (instancetype)init {
    if (self = [super init]) {
        int array[] = {10, 9, 2, 5, 3, 7, 101, 18};
        int length = sizeof(array) / sizeof(array[0]);
        
        int subLen = maxLengthOfAscendingSubsequenceByDynamic(array, length);
        printf("\n--------- maxLengthOfAscendingSubsequenceByDynamic --------\n\n");
        printf("maxSum: %d\n", subLen);
    }
    return self;
}

#pragma mark - 动态规划
/**
 * 以  [ 8, 2, 3, 1, 4] 为例拆解具体的过程
 *
 *  1、初始化数组 dp 的每个值为1
 *
 *  2、
 *      ↓
 *      8               2               3               1            4
 *     dp[0] = 1
 *
 *              ↓
 *      8               2               3               1            4
 *      2比8小，所以不更新dp[1], dp[1] = 1
 *
 *
 *                     ↓
 *      8               2               3               1            4
 *      3比8小，所以不更新dp[2], 但3比2大，所以2可以和3构成一个上升的子序列， dp[2] = dp[1] + 1 = 2
 *
 *
 *                             ↓
 *      8               2               3               1            4
 *      1比前面几个都小，所以不更新dp[3], dp[3] = 1
 *
 *
 *
 *                                   ↓
 *      8               2               3               1            4
 *      4比8小，不更新dp[4], dp[4] = 1
 *      4比2大，所以4可以和2构成一个上升的子序列，dp[4] = dp[1] + 1 = 2。也就是 [2, 4]
 *      4又比3大，所以4又可以和3结尾的子序列构成一个上升的子序列，dp[4] = dp[2] + 1 = 2 + 1 = 3, 也就是 [2, 3, 4]
 *      4还比1大，也可以和1构成上升的子序列 [1, 4]，但长度为2, 小于和3构成的上升子序列，我们要取最大的，综上 dp[4] = 3
 *
 *  时间复杂度 O(n * n)
 */
int maxLengthOfAscendingSubsequenceByDynamic(int * array, int length) {
    if (!array || length < 1) return 0;
    
    int * dp = malloc(sizeof(int) * length);
    // 初始化数组dp的每个值为1
    for (int i = 0; i < length; i ++) {
        dp[i] = 1;
    }
    
    int maxLen = 1;
    for (int i = 1; i < length; i ++) {
        for (int j = 0; j < i; j ++) {
            /**
             * 如果当前值array[i] > array[j]，说明array[i]可以和
             * array[j]结尾的上升序列构成一个新的上升子序列
             */
            if (array[i] > array[j]) {
                dp[i] = MAX(dp[i], dp[j] + 1);
                maxLen = MAX(maxLen, dp[i]);
            }
        }
    }
    if (dp) {
        free(dp);
    }
    return maxLen;
}

@end
