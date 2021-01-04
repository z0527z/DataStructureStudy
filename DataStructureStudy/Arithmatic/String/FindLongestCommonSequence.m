//
//  FindLongestCommonSequence.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/4.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "FindLongestCommonSequence.h"

@implementation FindLongestCommonSequence

- (instancetype)init {
    if (self = [super init]) {
        
        char * str1 = "ABCBDAB";
        char * str2 = "BDCABA";
        char * subSequence = findLongestCommonSequence(str1, str2);
        printf("\n---------- FindLongestCommonSequence ---------\n\n");
        printf("subSequence:%s\n", subSequence);
        if (subSequence) {
            free(subSequence);
        }
    }
    return self;
}

/**
 * 查找两个给定字符串的最长公共子序列，有多个时返回第一个就好
 */
char * findLongestCommonSequence(char * str1, char * str2) {
    if (!str1 || !str2) return NULL;
    
    // 创建二维数组
    
    // 对二维数组对角线赋值
    
    // 取出最长子序列
}

@end
