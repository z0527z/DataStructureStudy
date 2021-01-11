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
    
    int len1 = (int)strlen(str1);
    int len2 = (int)strlen(str2);
    
    // 创建内容二维数组
    int ** lcs = (int **)malloc(sizeof(int *) * (len1 + 1));
    for (int i = 0; i <= len1; i ++) {
        lcs[i] = (int *)malloc(sizeof(int) * (len2 + 1));
        memset(*(lcs + i), 0, len2 + 1);
    }
    
    // 对二维数组对角线赋值
    for (int i = 1; i <= len1; i ++) {
        for (int j = 1; j <= len2; j ++) {
            if (str1[i - 1] == str2[j - 1]) {
                lcs[i][j] = lcs[i - 1][j - 1] + 1;
            }
            else if (lcs[i][j - 1] > lcs[i - 1][j]) {
                lcs[i][j] = lcs[i][j - 1];
            }
            else {
                lcs[i][j] = lcs[i - 1][j];
            }
        }
    }
    
    // 取出最长子序列
    char * result = nonRecursivePrintLCS(lcs, len1, len2, str1);
    
    if (lcs) {
        for (int i = 0; i < len1; i ++) {
            if (lcs[i]) {
                free(lcs[i]);
            }
        }
        free(lcs);
    }

    return result;
}

#pragma mark - 迭代
char * nonRecursivePrintLCS(int ** lcs, int len1, int len2, char * str1) {
    int minLen = MIN(len1, len2);
    char * result = malloc(minLen);
    
    int k = lcs[len1][len2];
    result[k] = '\0';
    
    while (k > 0) {
        if (lcs[len1][len2] == lcs[len1 - 1][len2]) {
            len1 --;
        }
        else if (lcs[len1][len2] == lcs[len1][len2 - 1]) {
            len2 --;
        }
        else {
            result[--k] = str1[len1 - 1];
            len1 --;
            len2 --;
        }
    }
    return result;
}

#pragma mark - 递归
void recursivePrintLCS(int ** lcs, int len1, int len2, char * str1) {
    if (len1 == 0 || len2 == 0) return;

    if (lcs[len1][len2] == lcs[len1 - 1][len2]) {
        recursivePrintLCS(lcs, len1 - 1, len2, str1);
    }
    else if (lcs[len1][len2] == lcs[len1][len2 - 1]) {
        recursivePrintLCS(lcs, len1, len2 - 1, str1);
    }
    else {
        recursivePrintLCS(lcs, len1 - 1, len2 - 1, str1);
        printf("%c ", str1[len1 - 1]);
    }
}

@end
