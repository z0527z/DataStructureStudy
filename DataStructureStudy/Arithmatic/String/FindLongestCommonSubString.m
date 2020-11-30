//
//  FindLongestCommonSubString.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/30.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "FindLongestCommonSubString.h"

@implementation FindLongestCommonSubString

- (instancetype)init {
    if (self = [super init]) {
        char * str1 = "df2345123fdad";
        char * str2 = "ab2345ab";
        char * subString = findLongestCommonSubString(str1, str2);
        printf("\n---------- FindLongestCommonSubString ---------\n\n");
        printf("subString:%s\n", subString);
        if (subString) {
            free(subString);
        }
    }
    return self;
}

/**
 *  a   b   c   d   a    b
 *  -1  0   0   0   0   1
 *
 */

int * getNext(char * pattern) {
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
            
            if (containSubStr(str2, subStr)) {
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

@end
