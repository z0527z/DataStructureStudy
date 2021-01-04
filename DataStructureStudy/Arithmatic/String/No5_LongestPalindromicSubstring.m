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
        char * subStr = longestPalindromicSubstring(str);
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
    char * subStr = NULL;
    int subStrLen = end - start + 1;
    if (subStrLen > 0) {
        subStr = (char *)malloc(subStrLen + 1);
        strncpy(subStr, &str[start], subStrLen);
        subStr[subStrLen] = '\0';
    }
    return subStr;
}

@end
