//
//  BinaryDigitalCount.m
//  MyStudy
//
//  Created by jolin on 2019/10/7.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "BinaryDigitalCount.h"

@implementation BinaryDigitalCount

- (instancetype)init
{
    if (self = [super init]) {
        
        int count = countOfNumber1(15);
        printf("\n--------- BinaryDigitalCount --------\n\n");
        printf("%d\n", count);
    }
    
    return self;
}

int countOfNumber1(int n)
{
    int count = 0;
    while (n) {
        count ++;
        
        // 把一个整数减去 1 , 再和原整数做与运算，会把该整数最右边一个 1 变成 0.
        // 那么一个整数的二进制表示中有多少个 1 , 就可以进行多少次这样的操作
        n = (n - 1) & n;
    }
    return count;
}

@end
