//
//  ReverseString.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/7.
//  Copyright © 2021 jolin. All rights reserved.
//  反转字符串

#import "ReverseString.h"
#import "PrintDefine.h"

@implementation ReverseString

- (instancetype)init {
    if (self = [super init]) {
        
//        testReverseStringSimple();
//        testReverseStringIn2K();
        testReverseWordsInString();
    }
    return self;
}

#pragma mark - 简单反转（leetcode 344）
void testReverseStringSimple() {
    char array[] = {'h', 'e', 'l', 'l', 'o', '!'};
    int length = sizeof(array) / sizeof(array[0]);
    printf("\n---------- ReverseStringInArray ---------\n\n");
    printf("input:  ");
    printArrayOfChar(array, length);
    printf("\n");
    
    reverseStringInArray(array, length);
    
    
    printf("output: ");
    printArrayOfChar(array, length);
    printf("\n");
}

/**
 * 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
 * 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
 */
void reverseStringInArray(char * array, int length) {
    if (!array || length <= 1) return;
    
    for (int i = 0, j = length - 1; i < length && i < j; i ++, j --) {
        char temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

#pragma mark - 2K一组反转（leetcode 541）
void testReverseStringIn2K() {
    char * str = "abcdefghijklmnopqrstuvwxyz";
    int k = 5;
    
    printf("\n---------- ReverseStringInArray ---------\n\n");
    printf("input:  %s\n", str);
    char * reverseStr = reverseStringIn2K(str, k);
    printf("output:  %s\n", reverseStr);
    if (reverseStr) {
        free(reverseStr);
    }
}

/**
 * 给定一个字符串 s 和一个整数 k，你需要对从字符串开头算起的每隔 2k 个字符的前 k 个字符进行反转。
 * 如果剩余字符少于 k 个，则将剩余字符全部反转。
 * 如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。
 *
 * 示例:
 * 输入: s = "abcdefg", k = 2
 * 输出: "bacdfeg"
 *
 */
char * reverseStringIn2K(char * str, int k) {
    if (!str) return NULL;
    
    int len = (int)strlen(str);
    char * reverseStr = malloc(len + 1);
    strncpy(reverseStr, str, len);
    reverseStr[len] = '\0';
    
    // i每次跳2k个单位
    for (int i = 0; i < len; i += 2 * k) {
        // 反转前k个，超过总长度时取总长度
        int start = i, end = MIN(i + k - 1, len - 1);
        while (start < end) {
            reverseStr[start] = str[end];
            reverseStr[end] = str[start];
            start++;
            end--;
        }
    }
    return reverseStr;
}


#pragma mark - 反转字符串里的单词（leetcode 151）
void testReverseWordsInString() {
    char * str = " a good   example! ";
    
    printf("\n---------- ReverseStringInArray ---------\n\n");
    printf("input:  %s\n", str);
    char * reverseStr = reverseWordsInString(str);
    printf("output:  %s\n", reverseStr);
    if (reverseStr) {
        free(reverseStr);
    }
}

/**
 * 给定一个字符串，逐个翻转字符串中的每个单词。
 * 示例 1：
 * 输入: "the sky is blue"
 * 输出: "blue is sky the"
 *
 * 示例 2：
 * 输入: "  hello world!  "
 * 输出: "world! hello"
 * 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 *
 * 示例 3：
 * 输入: "a good   example"
 * 输出: "example good a"
 * 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 */
char * reverseWordsInString(char * str) {
    // 移除多余的空格
    char * trimStr = trimExtraSpace(str);
    
    int len = (int)strlen(trimStr);
    // 反转整个字符串
    reverseString(trimStr, 0, len - 1);
    
    // 反转单词
    reverseWord(trimStr);
    
    return trimStr;
}

/**
 * 取出每个单词，然后调用区分反转方法
 */
void reverseWord(char * str) {
    if (!str || (str && strlen(str) <= 1)) return;
    
    int len = (int)strlen(str);
    int end = len - 1;
    
    int i = 0;
    while (i < end) {
        int j = i;
        while (j <= end && str[j] != ' ') {
            j++;
        }
        reverseString(str, i, j - 1);
        i = j + 1;
    }
}

/**
 * 反转对应区间的字符串
 */
static void reverseString(char * str, int start, int end) {
    if (!str || (str && strlen(str) <= 1)) return;
    
    int len = (int)strlen(str);
    for (int i = start, j = end; i < j; i ++, j--) {
        char temp = str[i];
        str[i] = str[j];
        str[j] = temp;
    }
}

/**
 * 移除多余的空白
 */
char * trimExtraSpace(char * str) {
    if (!str) return NULL;
    
    int len = (int)strlen(str);
    // 去除头部的空格
    int start = 0;
    int end = len - 1;
    while (start <= end && str[start] == ' ') {
        start++;
    }
    // 去除尾部的空格
    while (start <= end && str[end] == ' ') {
        end--;
    }
    
    int trimLen = end - start;
    char * trimStr = malloc(trimLen + 1);
    memset(trimStr, 0, trimLen + 1);
    char * p = trimStr;
    
    // 去除中间多余的空格
    while (start <= end) {
        char c = str[start];
        // 要添加的字符不为空时直接添加
        if (c != ' ') {
            *p++ = c;
        }
        else if (*(p - 1) != ' ') { // 要添加的字符为空，并且trimStr最后一个字符不为空时添加，否则不处理
            *p++ = c;
        }
        start++;
    }
    
    return trimStr;
}


@end
