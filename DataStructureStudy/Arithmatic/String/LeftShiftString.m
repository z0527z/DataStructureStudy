//
//  LeftShiftString.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/7.
//  Copyright © 2021 jolin. All rights reserved.
//  左旋转字符串

#import "LeftShiftString.h"

@implementation LeftShiftString

- (instancetype)init {
    if (self = [super init]) {
        char * str = "abcdefg";
        int len = (int)strlen(str);
        char * input = malloc(len + 1);
        strncpy(input, str, len + 1);
        
        int k = 2;

        printf("\n---------- LeftShiftString ---------\n\n");
        printf("input:  %s\n", input);
        leftShiftString(input, k);
        printf("output:  %s\n", input);
        if (input) {
            free(input);
        }
    }
    return self;
}

/**
 * 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。
 * 比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
 *
 * 示例 1：
 * 输入: s = "abcdefg", k = 2
 * 输出: "cdefgab"
 *
 * 示例 2：
 * 输入: s = "lrloseumgh", k = 6
 * 输出: "umghlrlose"
 *
 * 限制：1 <= k < s.length <= 10000，不能申请额外空间，只能在本串上操作
 */
void leftShiftString(char * str, int k) {
    if (!str || (str && strlen(str) <= k)) return;
    
    int len = (int)strlen(str);
    // 整个字符串反转
    reverseString(str, 0, len - 1);
    // 对临界值左边执行反转
    reverseString(str, 0, len - k - 1);
    // 对临界值右边执行反转
    reverseString(str, len - k, len - 1);
}


static void reverseString(char * str, int start, int end) {
    if (!str || start >= end) return;
    // 反转字符串对应的区间
    for (int i = start, j = end; i < j; i ++, j --) {
        char temp = str[i];
        str[i] = str[j];
        str[j] = temp;
    }
}

@end
