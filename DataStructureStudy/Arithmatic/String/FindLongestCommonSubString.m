//
//  FindLongestCommonSubString.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/30.
//  Copyright © 2020 jolin. All rights reserved.
//  查找最长公共子串

#import "FindLongestCommonSubString.h"

@implementation FindLongestCommonSubString

- (instancetype)init {
    if (self = [super init]) {
        char * str1 = "df2345123fdad";
        char * str2 = "ab2345ab";
        char * subString = findLongestCommonSubStringLCS(str1, str2);
        printf("\n---------- FindLongestCommonSubString ---------\n\n");
        printf("subString:%s\n", subString);
        if (subString) {
            free(subString);
        }
    }
    return self;
}


#pragma mark - 暴力法
// 暴力法
char * findLongestCommonSubString(char * str1, char * str2) {
    if (!str1 || !str2) return NULL;
    
    int len1 = (int)strlen(str1);
    int len2 = (int)strlen(str2);
    
    char * longestSubStr = NULL;
    for (int i = 0; i < len1; i ++) {
        for (int j = i + 1; j < len1 - i - 1; j ++) {
            int subLen = j - i;
            char * subStr = malloc(sizeof(char) * subLen + 1);
            strncpy(subStr, str1 + i, subLen);
            subStr[subLen] = '\0';
            
            if (containSubStr(str2, subStr)) { // 同 strstr(str2, subStr)
                if (!longestSubStr || strlen(longestSubStr) < strlen(subStr)) {
                    if (longestSubStr) {
                        free(longestSubStr);
                    }
                    longestSubStr = malloc(sizeof(char) * subLen + 1);
                    strncpy(longestSubStr, subStr, subLen);
                    longestSubStr[subLen] = '\0';
                }
            }
            if (subStr) {
                free(subStr);
            }
        }
    }
    return longestSubStr;
}

/**
 *  a   b   c   d   a    b
 *  -1  0   0   0   0   1
 *
 */

static int * getNext(char * pattern) {
    if (!pattern) return NULL;
    
    int len = (int)strlen(pattern);
    int * next = (int *)malloc(sizeof(int) * len);
    next[0] = -1;
    
    int i = 0, j = -1;
    while (i < len - 1) {
        if (j == -1 || pattern[i] == pattern[j]) {
            ++ i;
            ++ j;
            next[i] = j;
        }
        else {
            j = next[j];
        }
    }
    return next;
}

bool containSubStr(char * str, char * subStr) {
    if (!str || !subStr) return false;
    int * next = getNext(subStr);
    
    int len = (int)strlen(str);
    int subLen = (int)strlen(subStr);
    
    int i = 0, j = 0;
    while (i < len && j < subLen) {
        if (j == -1 || str[i] == subStr[j]) {
            i ++;
            j ++;
        }
        else {
            j = next[j];
        }
    }
    
    bool contain = false;
    if (j == subLen) {
        contain = true;
    }
    if (next) free(next);
    return contain;
}

#pragma mark - 动态规划(LCS，时间复杂度为O(n*m)，空间复杂度为O(n*m)）
/**
 * https://www.cnblogs.com/chenleideblog/p/10457320.html
 *
 * 对角线上连续的1越多，表示两个字符串的最长公共子串越长
 */
char * findLongestCommonSubStringLCS(char * str1, char * str2) {
    if (!str1 || !str2) return NULL;
    
    int len1 = (int)strlen(str1);
    int len2 = (int)strlen(str2);
    
    // 创建二维数组
    int ** lcs = (int **)malloc(sizeof(int *) * len1);
    for (int i = 0; i < len1; i ++) {
        lcs[i] = malloc(sizeof(int) * len2);
        memset(lcs, 0, len2);
    }
    
    // 利用二维数组对对角线赋值
    int maxSubStrLen = 0;
    int endj = 0;
    for (int i = 1; i < len1; i ++) {
        for (int j = 1; j < len2; j ++) {
            if (str1[i - 1] == str2[j - 1]) {
                lcs[i][j] = lcs[i - 1][j - 1] + 1;
                
                if (lcs[i][j] > maxSubStrLen) {
                    maxSubStrLen = lcs[i][j];
                    endj = j;
                }
            }
            else {
                lcs[i][j] = 0;
            }
        }
    }
    // 取出最长的公共子串
    char * longestStr = malloc(maxSubStrLen + 1);
    int k = 0;
    for (int j = endj - maxSubStrLen; j < endj; j ++) {
        longestStr[k] = str2[j];
        k ++;
    }
    // 回收空间
    if (lcs) {
        for (int i = 0; i < len2; i ++) {
            if (lcs[i]) {
                free(lcs[i]);
            }
        }
        free(lcs);
    }
    return longestStr;
}

#pragma mark - 后缀树

@end
