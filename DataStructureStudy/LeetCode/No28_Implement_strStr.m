//
//  No28_Implement_strStr.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/26.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No28_Implement_strStr.h"

@implementation No28_Implement_strStr

- (instancetype)init {
    if (self = [super init]) {
        char * needle = "";
        char * haystack = "";
        int pos = myStrStr(haystack, needle);
        printf("\n---------- No28_Implement_strStr ---------\n\n");
        printf("pos: %d\n", pos);
    }
    return self;
}

static int * getNext(char * pattern) {
    if (!pattern) return NULL;
    
    int len = (int)strlen(pattern);
    if (len < 1) return NULL;
    
    int * next = malloc(sizeof(int) * len);
    next[0] = -1;
    // 后缀
    int i = 0;
    // 前缀
    int j = -1;
    
    while (i < len - 1) {
        if (j == -1 || pattern[i] == pattern[j]) {
            i ++;
            j ++;
            next[i] = j;
        }
        else {
            j = next[j];
        }
    }
    return next;
}

// 采用 KMP 算法实现
int myStrStr(char * haystack, char * needle) {
    if (!needle || strlen(needle) < 1) return 0;
    if (!haystack || strlen(haystack) < 1) return -1;
    
    int len1 = (int)strlen(haystack);
    int len2 = (int)strlen(needle);
    
    int * next = getNext(needle);
    
    int i = 0, j = 0;
    while (i < len1 && j < len2) {
        if (j == -1 || haystack[i] == needle[j]) {
            i ++;
            j ++;
        }
        else {
            j = next[j];
        }
    }
    int index = -1;
    if (j == len2) {
        index = i - j;
    }
    if (next) free(next);
    return index;
}

@end
