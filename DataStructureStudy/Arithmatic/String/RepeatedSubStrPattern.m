//
//  RepeatedSubStrPattern.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/9.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "RepeatedSubStrPattern.h"

@implementation RepeatedSubStrPattern

- (instancetype)init {
    if (self = [super init]) {
        
        char * str = "abcabc";
        bool flag = repeatedSubstrPattern(str);
        printf("\n---------- RepeatedSubStrPattern ---------\n\n");
        printf("%s\n", flag ? "true" : "false");
        
    }
    return self;
}

bool repeatedSubstrPattern(char * str) {
    if (!str) return false;
    
    int len = (int)strlen(str);
    char * p1 = str;
    char * p2 = p1 + 1;
    char * subStr = NULL;
    bool isRepeated = true;
    
    for (int i = 0; i < len; i ++) {
        if (*p1 != *p2) {
            p2++;
        }
        else {
            int l = (int)(p2 - p1);
            subStr = malloc(sizeof(l) + 1);
            strncpy(subStr, str, l);
            break;
        }
    }
    
    if (subStr) {
        while (*p2 != '\0') {
            isRepeated = containSubStr(p2, subStr);
            if (!isRepeated) {
                break;
            }
            p2 += strlen(subStr);
        }
        free(subStr);
    }
    else {
        isRepeated = false;
    }
    
    return isRepeated;
}

bool containSubStr(char * str, char * subStr) {
    if (!str || !subStr) return false;
    
    int len = (int)MIN(strlen(str), strlen(subStr));
    bool isContain = true;
    for (int i = 0; i < len; i ++) {
        if (str[i] != subStr[i]) {
            isContain = false;
            break;
        }
    }
    return isContain;
}

@end
