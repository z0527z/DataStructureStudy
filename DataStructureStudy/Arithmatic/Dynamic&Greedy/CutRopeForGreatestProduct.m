//
//  CutRopeForGreatestProduct.m
//  MyStudy
//
//  Created by jolin on 2019/10/26.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "CutRopeForGreatestProduct.h"

@implementation CutRopeForGreatestProduct

- (instancetype)init
{
    if (self = [super init]) {
        
        int m = 50;
        int maxProduct = dynamicProgramingSolveCutRopeForGreatestProduct(m);
        int max = greedyAlgorithmSolveCutRopeForGreatestProduct(m);
        
        printf("\n--------- CutRopeForGreatestProduct --------\n\n");
        printf("%d, %d\n", maxProduct, max);
    }
    return self;
}



/**
 剪绳子:
        给你一根长度为 n 的绳子，请把绳子剪成 m 段(m、n 都是整数，n > 1 并且 m > 1),
 每段绳子的长度为 k[0], k[1], ..., k[m]. 请问 k[0]xk[1]x...xk[m]可能的最大乘积是多少？
 例如，当绳子的长度是 8 时，我们把它剪成长度分别为 2、3、3 的三段，此时得到的最大乘积是 18.

 动态规划解法:
 @param length 绳子的长度
 @return 返回剪成m段后最大的乘积
 */
int dynamicProgramingSolveCutRopeForGreatestProduct(int length)
{
    if (length < 2) return 0;
    if (length == 2) return 1;
    if (length == 3) return 2;
    
    int products[length + 1];
    products[0] = 0;
    products[1] = 1;
    products[2] = 2;
    products[3] = 3;
    
    int max = 0;
    for (int i = 4; i <= length; i ++) {
        max = 0;
        for (int j = 1; j <= i/2; j ++) {
            int product = products[j] * products[i - j];
            if (max < product) {
                max = product;
            }
            products[i] = max;
        }
    }
    max = products[length];
    return max;
}


/**
 贪婪解法:
        当 n >= 5时，可以证明 2(n-2) > n 并且 3(n-3) > n
 也就是说，当绳子剩下的长度大于或者等于 5 的时候，就把它剪成长度
 为 3 或者 2 的绳子段。另外，当 n >= 5 时， 3(n-3) >= 2(n-2)
 所以应该尽可能的剪成长度为 3 的绳子段。

 @param length 绳子的长度
 @return 返回剪成m段后最大的乘积
 */
int greedyAlgorithmSolveCutRopeForGreatestProduct(int length)
{
    if (length < 2) return 0;
    if (length == 2) return 1;
    if (length == 3) return 2;
    
    // 尽可能多的剪成 3 的倍数段
    int timesOf3 = length / 3;
    
    // 当绳子最后剩下的长度为 4 时，不能再剪成 3 的倍数段了，因为 2*2 > 3*1
    if (length - timesOf3 * 3 == 1) {
        timesOf3--;
    }
    
    int timesOf2 = (length - timesOf3 * 3) / 2;
    return (int)pow(3, timesOf3) * (int)pow(2, timesOf2);
}

@end
