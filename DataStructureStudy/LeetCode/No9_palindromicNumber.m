//
//  No9_palindromicNumber.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/3/17.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "No9_palindromicNumber.h"

@implementation No9_palindromicNumber

- (instancetype)init
{
    if (self = [super init]) {
        
        int value = 1221; // 12321
        bool isPalindromic = isPalindromicNumber(value);
        printf("\n----------- No9_palindromicNumber ----------\n\n");
        printf("input: %d\n", value);
        printf("output: %s\n", isPalindromic == true ? "true" : "false");
    }
    return self;
}

bool isPalindromicNumber(int number)
{
    if (number < 0 || (number / 10 == 0 && number != 0)) {
        return false;
    }
    
    int reverseNumber = 0;
    // 反转一半，对于整数来说意味着 >
    while (number > reverseNumber) {
        reverseNumber = reverseNumber * 10 + number % 10;
        number /= 10;
    }
    return reverseNumber == number || reverseNumber / 10 == number;
}

@end
