//
//  Implement_pow.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2021/1/4.
//  Copyright © 2021 jolin. All rights reserved.
//

#import "Implement_pow.h"

@implementation Implement_pow

- (instancetype)init {
    if (self = [super init]) {
        double base = 3.2;
        int exponent = 6;
        double result = myPower(base, exponent);
        printf("\n------------ Implement_pow ----------\n\n");
        printf("%lf\n", result);
    }
    return self;
}

/**
 * 实现函数 double Power(double base, int exponent), 求base的exponent次方。
 * 不得使用库函数，同时不需要考虑大数问题
 */
double myPower(double base, int exponent) {
    if (base == 0.0 && exponent < 0) return 0.0;
    
    unsigned int absExponent = (unsigned int)exponent;
    if (exponent < 0) {
        absExponent = -exponent;
    }
    double resut = powWithExponent(base, absExponent);
    if (exponent < 0) {
        resut = 1.0/resut;
    }
    return resut;
}

double powWithExponent(double base, unsigned int exponent) {
    if (exponent == 0) return 1;
    if (exponent == 1) return base;
     
    double result = powWithExponent(base, exponent >> 1);
    result *= result;
    if ((exponent & 0x1) == 1) {
        result *= base;
    }
    return result;
}

@end
