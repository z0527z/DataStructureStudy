//
//  No14_LongestCommonPrefixInArray.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/21.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No14_LongestCommonPrefixInArray.h"

@implementation No14_LongestCommonPrefixInArray

- (instancetype)init {
    if (self = [super init]) {
//        char * strs[] = {"flower","flow","flight"};
//        char * prefix = longestCommonPrefix((char **)&strs, sizeof(strs));
        NSArray * strs = @[@"flower", @"flow", @"flight"];
        NSString * prefix = [self longestCommonPrefix:strs];
        printf("\n---------- No14_LongestCommonPrefixInArray ---------\n\n");
        NSLog(@"prefix:%@", prefix);
    }
    return self;
}


char * longestCommonPrefix(char ** str, int strSize) {
    if (!str || !*str || strSize < 1) return "";
    int len = (int)strlen(*str);
    char * prefix = malloc(len + 1);
    strncpy(prefix, *str, len);
    prefix[len] = '\0';
    
    char ** p = str;
    for (int i = 1; i < strSize; i ++) {
        char * nextStr = *(p + i);
        int min = MIN((int)strlen(prefix), (int)strlen(nextStr));
        int prefixLen = 0;
        for (int i = 0; i < min; i ++) {
            if (nextStr[i] == prefix[i]) {
                prefixLen ++;
            }
            else {
                
                
            }
        }
    }
}



- (NSString *)longestCommonPrefix:(NSArray<NSString *> *)strs {
    if (!strs || strs.count == 0) return @"";
    
    return [self longestCommon:strs left:0 right:strs.count - 1];
}

- (NSString *)longestCommon:(NSArray<NSString *> *)strs left:(NSInteger)left right:(NSInteger)right {
    if (left == right) return strs[left];
    
    NSInteger mid = (left + right) / 2;
    NSString * leftStr = [self longestCommon:strs left:left right:mid];
    NSString * rightStr = [self longestCommon:strs left:mid + 1 right:right];
    return [self commonPrefix:leftStr rightStr:rightStr];
}

- (NSString *)commonPrefix:(NSString *)leftStr rightStr:(NSString *)rightStr {
    NSInteger min = MIN(leftStr.length, rightStr.length);
    for (NSInteger i = 0; i < min; i ++) {
        if ([leftStr characterAtIndex:i] != [rightStr characterAtIndex:i]) {
            return [leftStr substringWithRange:NSMakeRange(0, i)];
        }
    }
    return [leftStr substringWithRange:NSMakeRange(0, min)];
}

@end
