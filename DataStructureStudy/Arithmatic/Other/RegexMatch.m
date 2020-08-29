//
//  RegexMatch.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/8/29.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "RegexMatch.h"

@implementation RegexMatch

- (instancetype)init
{
    if (self = [super init]) {
        char * regex = "r*g.";
        char * input = "rgu";
        bool isMatch = isRegexMatch(regex, input);
        printf("\n------------ RegexMatch ----------\n\n");
        printf("%s", isMatch ? "true" : "false");
    }
    return self;
}

bool isRegexMatch(char * regex, char * str) {
    if (!regex || !str) return false;
    return matchCore(regex, str);
}

bool matchCore(char * regex, char * str) {
    if (*str == '\0' && *regex == '\0') return true;
    if (*str != '\0' && *regex == '\0') return false;
    
    if (*(regex + 1) == '*') {
        if (*regex == *str || (*str != '\0' && *regex == '.')) {
            // 进入有限状态机的下一个状态
            return matchCore(regex + 2, str + 1)
            // 继续留在当前状态
            || matchCore(regex, str + 1)
            // 略过一个'*'
            || matchCore(regex + 2, str);
        }
        else {
            return matchCore(regex + 2, str);
        }
    }
    if (*str == *regex || (*regex == '.' && *str != '\0')) {
        return matchCore(regex + 1, str + 1);
    }
    return false;
}



@end
