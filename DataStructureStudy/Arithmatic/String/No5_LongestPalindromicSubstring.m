//
//  No5_LongestPalindromicSubstring.m
//  DataStructureStudy
//
//  Created by jolin on 2020/11/15.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "No5_LongestPalindromicSubstring.h"

@implementation No5_LongestPalindromicSubstring

- (instancetype)init {
    if (self = [super init]) {
        char * str = "XMADAMYX";
        char * subStr = longestPalindromicSubstringDynamic(str);
        printf("\n------- No5_LongestPalindromicSubstring ------\n\n");
        printf("subStr: %s\n", subStr);
        if (subStr) {
            free(subStr);
        }
    }
    return self;
}

int findSubStrIndex(char * str, int start, int end) {
    int l = start, r = end;
    int len = (int)strlen(str);
    while (l >= 0 && r < len && str[l] == str[r]) {
        l--;
        r++;
    }
    return r -l -1;
}

/**
 * 中心扩散算法
 */
char * longestPalindromicSubstring(char * str) {
    if (!str || strlen(str) < 1) return "";
    int len = (int)strlen(str);
    int start = 0, end = 0;
    for (int i = 0; i < len; i ++) {
        int len1 = findSubStrIndex(str, i, i);
        int len2 = findSubStrIndex(str, i, i + 1);
        int len = MAX(len1, len2);
        if (len > end - start) {
            start = i - (len - 1)/2;
            end = i + len/2;
        }
    }
    int subStrLen = end - start + 1;
    char * subStr = (char *)malloc(subStrLen + 1);
    if (subStrLen > 1) {
        strncpy(subStr, &str[start], subStrLen);
    }
    else if (subStrLen == 1) {
        subStr[0] = str[0];
    }
    subStr[subStrLen] = '\0';
    return subStr;
}


#pragma mark - 动态规划方案
char * longestPalindromicSubstringDynamic(char * str) {
    if (!str || strlen(str) < 1) return "";
    int len = (int)strlen(str);
    
    // 第 i 个字符到第 j 个字符是否是回文串
    char ** dp = (char **)malloc(len * sizeof(char *));
    for (int i = 0; i < len; i ++) {
        *(dp + i) = malloc(len * sizeof(char));
        memset(*(dp + i), 0, len);
    }
    
    int start = 0;
    int maxLen = 0;
    // 字符串首尾字母长度差 (d = j-i)
    for (int d = 0; d < len; d ++) {
        // 字符串起始位置 i
        for (int i = 0; i < len - d; i ++) {
            // 字符串结束位置 j
            int j = i + d;
            // 如果字符串 i 到 j 的首尾相等，再根据字符串 i+1 到 j-1 来确定，即得到递推公式
            if (str[i] == str[j]) {
                if (d == 0 || d == 1) {
                    dp[i][j] = 1;
                }
                else {
                    dp[i][j] = dp[i + 1][j - 1];
                }
                // 更新最大长度和首位置
                if (dp[i][j]) {
                    start = i;
                    maxLen = MAX(maxLen, d + 1);
                }
            }
        }
    }
    // 取出回文串
    char * tempStr = malloc(maxLen + 1);;
    if (maxLen > 1) {
        strncpy(tempStr, str + start, maxLen);
    }
    else if (maxLen == 1) {
        tempStr[0] = str[0];
    }
    tempStr[maxLen] = '\0';
    
    return tempStr;
}

@end
