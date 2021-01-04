//
//  FindLongestRepeatedSubString.m
//  DataStructureStudy
//
//  Created by jolin on 2020/12/5.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "FindLongestRepeatedSubString.h"

@implementation FindLongestRepeatedSubString

- (instancetype)init {
    if (self = [super init]) {
        
        char * str = "aaaaabbb";
        char * subStr = findLongestRepeatedSubString(str);
        printf("\n---------- FindLongestRepeatedSubString ---------\n\n");
        printf("subString:%s\n", subStr);
        if (subStr) {
            free(subStr);
        }
    }
    return self;
}

bool isEqual(char * str1, char * str2) {
    if (!str1) return str2 == NULL;
    if (!str2) return false;
    
    char * p1 = str1;
    char * p2 = str2;
    
    bool equal = true;
    while (*p1 != '\0' && *p2 != '\0') {
        if (*p1 == *p2) {
            p1 ++;
            p2 ++;
        }
        else {
            equal = false;
            break;
        }
    }
    return equal;
}
// 暴力法
char * findLongestRepeatedSubString(char * str) {
    if (!str || strlen(str) <= 1) return NULL;
    
    
    int len = (int)strlen(str);
    char * lastSubString = NULL;
    
    char * tempStr = malloc(len + 1);
    int maxLen = 1, pos = 0, count = 0;
    // 从长度1开始，依次截取子串进行比较
    for (int i = 1; i < len; i ++) {
        for (int j = 0; j < len - i - 1; j ++) {
            strncpy(tempStr, str + j, i + 1);
            tempStr[i + 1] = '\0';
            for (int k = 0, count = 0; k < len - i; k ++) {
                if (strncmp((str + k), tempStr, i + 1) ==  0) {
                    count ++;
                    if (count != 1) {
                        if (i >= maxLen) {
                            maxLen = i + 1;
                            pos = k;
                        }
                    }
                }
            }
        }
    }
    free(tempStr);
    char * subStr = malloc(maxLen + 1);
    strncpy(subStr, str + pos, maxLen);
    subStr[maxLen] = '\0';
    return subStr;
}

#pragma mark - 后缀数组


#pragma mark - 后缀树

@end
