//
//  FindNumIn2DArray.m
//  MyStudy
//
//  Created by jolin on 2019/9/30.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "FindNumIn2DArray.h"

@implementation FindNumIn2DArray

- (instancetype)init
{
    if (self = [super init]) {
        /**
         * 左 -> 右 (递增)
         * 上 -> 下 (递增)
         */
        int array[4][4] = {
            {1, 2, 8, 9},
            {2, 4, 9, 12},
            {4, 7, 10, 13},
            {6, 8, 11, 15}
        };
        BOOL didFind = findNum((int *)array, 4, 4,  7);
        printf("%d\n", didFind);
    }
    return self;
}

bool findNum(int * array, int hLength, int vLength, int num)
{
    // 异常检测
    if (array == NULL || hLength <= 0 || vLength <= 0) return false;
    
    BOOL flag = false;
    
    // 从右上角开始查找
    int column = hLength - 1;
    int row = 0;
    //找到左下角为止
    while (column >= 0 && row <= vLength - 1) {
        int value = array[row * hLength + column];
        if (value > num) { // 剔除列
            column--;
        }
        else if (value < num) { // 剔除行
            row++;
        }
        else {
            flag = true;
            break;
        }
    }
    
    return flag;
}

@end
