//
//  Fibonacci.m
//  MyStudy
//
//  Created by jolin on 2019/10/5.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "Fibonacci.h"

@implementation Fibonacci

- (instancetype)init
{
    if (self = [super init]) {
        long long value = noneRecursiveFibonacci(50);
        printf("\n-------------- Fibonacci ------------\n\n");
        printf("%lld\n", value);
        
    }
    return self;
}

long long fibonacci(int n)
{
    if (n <= 0) return 0;
    if (n == 1) return 1;
    
    return fibonacci(n - 1) + fibonacci(n - 2);
}


/**
 面试题9: 斐波那契数列
 
 写一个函数, 输入n, 求斐波那契(Fibonacci)数列的第n项。斐波那契数列的定义如下:
        {       0           n = 0
 f(n) = |       1           n = 1
        {f(n-1) + f(n-2)    n > 1
 
 @param n 斐波那契数列的第 n 项
 @return 对应的值
 */
long long noneRecursiveFibonacci(int n)
{
    if (n <= 0) return 0;
    if (n == 1) return 1;
    
    long long fibMinusOne = 1;
    long long fibMinusTwo = 0;
    long long fibN = 0;
    for (int i = 2; i <= n; i ++) {
        fibN = fibMinusOne + fibMinusTwo;
        
        // 保留前两项的值，则不需要重新计算
        fibMinusTwo = fibMinusOne;
        fibMinusOne = fibN;
    }
    return fibN;
}

@end
