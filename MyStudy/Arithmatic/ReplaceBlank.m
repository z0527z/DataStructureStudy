//
//  ReplaceBlank.m
//  MyStudy
//
//  Created by jolin on 2019/9/30.
//  Copyright © 2019年 jolin. All rights reserved.
//
//  在原字符串上替换空格

#import "ReplaceBlank.h"

@implementation ReplaceBlank

- (instancetype)init
{
    if (self = [super init]) {
        
        char str[20] = " We are happy.";
        replaceBlankInString(str, 20);
        
        printf("%s\n", str);
    }
    return self;
}

void replaceBlankInString(char * str, int length)
{
    if (str == NULL || length <= 0) return;
    
    int blankCount = 0;
    char * p = str;
    while (*p != '\0') {
        if (*p == ' ') {
            blankCount++;
        }
        p++;
    }
    
    char * p1 = p;
    char * p2 = p + 2 * blankCount;
    // 替换后的内容长度会超过给定长度
    if (p2 > str + length) return;
    
    while (p1 >= str && p2 >= str && p1 < p2) {
        if (*p1 == ' ') {
            *p2-- = '0';
            *p2-- = '2';
            *p2-- = '%';
            p1--;
        }
        else {
            *p2-- = *p1--;
        }
    }
}

@end
