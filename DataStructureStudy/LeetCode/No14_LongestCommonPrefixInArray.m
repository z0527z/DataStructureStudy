//
//  No14_LongestCommonPrefixInArray.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/21.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No14_LongestCommonPrefixInArray.h"

@implementation No14_LongestCommonPrefixInArray

- (instancetype)init {
    if (self = [super init]) {
        char * strs[] = {};//{"flow", "flower","flight"};
        char * prefix = longestCommonPrefix((char **)&strs, sizeof(strs) / sizeof(char *));
        printf("\n---------- No14_LongestCommonPrefixInArray ---------\n\n");
        printf("prefix:%s\n", prefix);
        if (strlen(prefix) > 0) {
            free(prefix);
        }
    }
    return self;
}

#if 1
char * longestCommonPrefix(char ** str, int strSize) {
    if (!str || strSize < 1) return "";
    int len = (int)strlen(*str);
    char * prefix = malloc(len + 1);
    strncpy(prefix, *str, len);
    prefix[len] = '\0';
    
    char ** p = str;
    for (int i = 1; i < strSize; i ++) {
        char * nextStr = *(p + i);
        int min = MIN((int)strlen(prefix), (int)strlen(nextStr));
        int prefixLen = 0;
        for (int i = 0; i < min; i ++) {
            if (nextStr[i] == prefix[i]) {
                prefixLen ++;
            }
            else {
                break;
            }
        }
        if (prefixLen) {
            char * temp = malloc(prefixLen + 1);
            strncpy(temp, prefix, prefixLen);
            temp[prefixLen] = '\0';
            
            free(prefix);
            prefix = temp;
        }
        else {
            free(prefix);
            return "";
        }
    }
    return prefix;
}
#else

#pragma mark - 归并
char * longestCommonPrefix(char ** strs, int strsSize) {
    if (!strs || !*strs || strsSize < 1) return "";
    
    return longestCommon(strs, 0, strsSize - 1);
}

char * longestCommon(char ** strs, int start, int end) {
    if (start == end) return strs[start];
    
    int mid = (start + end) / 2;
    
    char * leftStr = longestCommon(strs, start, mid);
    char * rightStr = longestCommon(strs, mid + 1, end);
    
    // 从左右中找出公共前缀
    return commonPrefix(leftStr, rightStr);
}

char * commonPrefix(char * leftStr, char * rightStr) {
    int minLen = MIN((int)strlen(leftStr), (int)strlen(rightStr));
    int len = minLen;
    for (int i = 0; i < minLen; i ++) {
        if (leftStr[i] != rightStr[i]) {
            len = i;
            break;
        }
    }
    char * result = malloc(sizeof(char) * len + 1);
    strncpy(result, leftStr, len);
    result[len + 1] = '\0';
    return result;
    
}


#endif

@end
