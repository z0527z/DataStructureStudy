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
        
        char * str = "abaababaab";
        bool flag = repeatedSubstrPattern(str);
        printf("\n---------- RepeatedSubStrPattern ---------\n\n");
        printf("%s\n", flag ? "true" : "false");
        
    }
    return self;
}

#if 1
#pragma mark - 方案1
bool repeatedSubstrPattern(char * str) {
    if (!str) return false;
    
    // 构造两个 str 相加后首位各减去一个的新串
    int len = (int)strlen(str);
    int compundLen = 2 * len - 2;
    char * compoundStr = malloc(compundLen + 1);
    strncpy(compoundStr, str + 1, len - 1);
    strncpy(compoundStr + len - 1, str, len - 1);
    compoundStr[compundLen] = '\0';
    printf("%s", compoundStr);
    
    bool ret = false;
    // 检查构造的中是否含有str
    int m = compundLen - len > 0 ? compundLen - len : 1;
    for (int i = 0; i < compundLen; i ++) {
        char * p = compoundStr + i;
        bool dismatch = false;
        for (int j = 0; j < len; j ++) {
            if (str[j] != *p++) {
                dismatch = true;
                break;
            }
        }
        if (!dismatch) {
            ret = true;
            break;
        }
    }
    
    free(compoundStr);
    
    return ret;
}

#else

int * nextArray(char * pattern) {
    if (!pattern) return NULL;
    
    int len = (int)strlen(pattern);
    int * nextArray = malloc(sizeof(int) * (len + 1));
    nextArray[0] = -1;
    int k = -1;
    int j = 0;
    
    while (j < len - 1) {
        if (k == -1 || nextArray[j] == nextArray[k]) {
            if (pattern[++j]  == pattern[++k]) { // 当两个字符相等时要跳过
                nextArray[j] = nextArray[k];
            }
            else {
                nextArray[j] = k;
            }
        }
        else {
            k = nextArray[k];
        }
    }
    return nextArray;
}

int kmp(char * str, char * pattern) {
    int * next = nextArray(pattern);
    int j = 0; // 主串的位置
    int k = 0; // 模式串的位置
    int len = (int)strlen(str);
    int pLen = (int)strlen(pattern);
    while (j < len && k < pLen) {
        if (k == -1 || str[j] == pattern[k]) {
            j++;
            k++;
        }
        else {
            k = next[k];
        }
    }
    free(next);
    if (k == pLen) {
        return j - k;
    }
    else {
        return -1;
    }
}


#endif
@end
