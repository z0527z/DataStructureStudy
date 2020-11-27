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
        char * needle = "ll";
        char * haystack = "hello";
        int pos = myStrStr(haystack, needle);
        printf("\n---------- No28_Implement_strStr ---------\n\n");
        printf("pos: %d\n", pos);
    }
    return self;
}

int myStrStr(char * haystack, char * needle) {
    if (!haystack || !needle) return 0;
    
    int len = (int)strlen(haystack);
    for (int i = 0; i < len; i ++) {
        
    }
    return 0;
}

@end
