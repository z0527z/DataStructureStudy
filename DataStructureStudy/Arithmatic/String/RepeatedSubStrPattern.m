//
//  RepeatedSubStrPattern.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/9.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "RepeatedSubStrPattern.h"

@implementation RepeatedSubStrPattern

- (instancetype)init {
    if (self = [super init]) {
        
        char * str = "abaababaab";
        bool flag = repeatedSubstrPattern(str);
        printf("\n---------- RepeatedSubStrPattern ---------\n\n");
        printf("%s\n", flag ? "true" : "false");
        
    }
    return self;
}

#if 1
bool repeatedSubstrPattern(char * str) {
    if (!str) return false;
    
    // 构造两个 str 相加后首位各减去一个的新串
    int len = (int)strlen(str);
    int compundLen = 2 * len - 2;
    char * compoundStr = malloc(compundLen + 1);
    strncpy(compoundStr, str + 1, len - 1);
    strncpy(compoundStr + len - 1, str, len - 1);
    compoundStr[compundLen] = '\0';
    printf("%s", compoundStr);
    
    bool ret = false;
    // 检查构造的中是否含有str
    int m = compundLen - len > 0 ? compundLen - len : 1;
    for (int i = 0; i < compundLen; i ++) {
        char * p = compoundStr + i;
        bool dismatch = false;
        for (int j = 0; j < len; j ++) {
            if (str[j] != *p++) {
                dismatch = true;
                break;
            }
        }
        if (!dismatch) {
            ret = true;
            break;
        }
    }
    
    free(compoundStr);
    
    return ret;
}

#else



#endif
@end
