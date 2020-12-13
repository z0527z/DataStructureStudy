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
        
        char * s = "abcabcbb";
        int length = findLonggestSubStringWithoutRepeating(s);
        printf("\n------- No3_findLonggestSubStringWithoutRepeating ------\n\n");
        printf("length: %d\n", length);
        
    }
    return self;
}

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

@end
