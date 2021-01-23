//
//  No3_findLongestSubStringWithoutRepeating.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/4/20.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No3_findLongestSubStringWithoutRepeating.h"

@implementation No3_findLongestSubStringWithoutRepeating

- (instancetype)init
{
    if (self = [super init]) {
        
        char * s = "pwwkew";
        int length = lengthOfLongestSubstring(s);
        printf("\n------- No3_findLonggestSubStringWithoutRepeating ------\n\n");
        printf("length: %d\n", length);
        
    }
    return self;
}

// 无重复字符的最长子串
int findLonggestSubStringWithoutRepeating(char * s) {
    if (!s) return 0;
    
    int len = 0;
    char * end = s, * temp;
    char * addressTabe[128] = { NULL };
    while (*end) {
        temp = addressTabe[*end];
        addressTabe[*end] = end;
        if (temp >= s) {
            len = end - s > len ? (int)(end - s) : len;
            s = temp + 1;
        }
        end ++;
    }
    len = end - s > len ? (int)(end - s) : len;
    return len;
}

/**
 * 滑动窗口解法
 */
int lengthOfLongestSubstring(char * s){
    
    int start = 0;
    int end = 0;
    int length = 0;
    int max = 0;
    
    int len = (int)strlen(s);
    while(end < len) {
        /* 记录当前end值
         * 用于和索引值index进行对比
         */
        char tmpchar = s[end];
        
        /* 索引值从start开始，计算到end-1位置处 */
        for(int index = start; index < end; index++) {
            /* 若发现最新得end值与索引值相同 */
            if(tmpchar == s[index]) {
                /* 将start移动到当前索引index下一个位置 */
                start = index + 1;
                /* 从新计算长度 */
                length = end - start;
                break;
            }
        }
        length++;
        end++;
        max = max < length ? length : max;
    }

    return max;
}

@end
