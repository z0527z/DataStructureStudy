//
//  No8_StringToInteger.m
//  DataStructureStudy
//
//  Created by jolin on 2020/11/20.
//  Copyright © 2020年 jolin. All rights reserved.
//

#import "No8_StringToInteger.h"

@implementation No8_StringToInteger

- (instancetype)init {
    if (self = [super init]) {
        char * str = "2147483646";
        int ret = stringToInteger(str);
        printf("\n---------- No8_StringToInteger ---------\n\n");
        printf("ret: %d\n", ret);
        
        int integer = atoi(str);
        printf("integer: %d\n", integer);
    }
    return self;
}

int stringToInteger(char * str) {
    if (!str || strlen(str) < 1) return -1;
    
    int nagitiveFlag = 1;
    char * p = str;
    // 先过滤掉所有的空格
    while (*p == ' ') p ++;
    
    // 再判断是否有 +'、'-'
    if (*p == '-') {
        nagitiveFlag = -1;
        p ++;
    }
    
    if (*p == '+') {
        // 有了'-'之后不能再有'+'
        if (nagitiveFlag == -1) return 0;
        p ++;
    }
    
    int ret = 0;
    while (*p != '\0') {
        if (*p >= '0' && *p <= '9') {
            // 处理溢出
            if (ret > INT_MAX / 10 || (ret == INT_MAX / 10 && *p - '0' > INT_MAX % 10)) {
                return (nagitiveFlag == 1) ? INT_MAX : INT_MIN;
            }
            ret = (*p - '0') + ret * 10;
            p ++;
            continue;
        }
        break;
    }
    return  ret * nagitiveFlag;
}

@end
