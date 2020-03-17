//
//  No7_reverseInteger.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/16.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No7_reverseInteger.h"

@implementation No7_reverseInteger

- (instancetype)init
{
    if (self = [super init]) {
        int origin = -123;
        int value = reverseInteger(origin);
        printf("\n----------- No7_reverseInteger ----------\n\n");
        printf("%d, %d\n", origin, value);
        
    }
    return self;
}


/// 整数反转：
/// 给出一个32位的有符号整数，将整数中每位上的数字进行反转
/// @param value 输入值
int reverseInteger(int value)
{
    int reverseNumber = 0;
    while (value != 0) {
        int pos = value % 10;
        reverseNumber = reverseNumber * 10 + pos;
        if (reverseNumber > INT32_MAX || reverseNumber < INT32_MIN) {
            return 0;
        }
        value /= 10;
    }
    return reverseNumber;
}

@end
