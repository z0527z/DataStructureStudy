//
//  FindFirstCharactorOnlyAppearOnce.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/7.
//  Copyright © 2021 jolin. All rights reserved.
//  字符串中第一个只出现一次的字符

#import "FindFirstCharactorOnlyAppearOnce.h"

@implementation FindFirstCharactorOnlyAppearOnce

- (instancetype)init {
    if (self = [super init]) {
        char * str = "abaccdeff";
        char * result = findFirstCharactorOnlyAppearOnce(str);
        printf("\n---------- FindFirstCharactorOnlyAppearOnce ---------\n\n");
        printf("result:%s\n", result);
        if (result) {
            free(result);
        }
    }
    return self;
}

/**
 * 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。
 */
char * findFirstCharactorOnlyAppearOnce(char * str) {
    if (!str || (str && strlen(str) == 0)) return " ";
    
    int len = (int)strlen(str);
    char dp[26] = {0};
    // 遍历第一遍，将对应的字符转成 index， 在数组dp中存对应的计数
    for (int i = 0; i < len; i ++) {
        char c = str[i];
        int index = c - 'a';
        if (dp[index]) {
            dp[index] = dp[index] + 1;
        }
        else {
            dp[index] = 1;
        }
    }
    
    char * resut = malloc(2);
    resut[0] = ' ';
    resut[1] = '\0';
    // 从头到尾遍历字符串str，找出第一个在dp中计数为1的字符
    for (int i = 0; i < len; i ++) {
        char c = str[i];
        int index = c - 'a';
        if (dp[index] == 1) {
            *resut = c;
            break;
        }
    }
    return resut;
}

@end
