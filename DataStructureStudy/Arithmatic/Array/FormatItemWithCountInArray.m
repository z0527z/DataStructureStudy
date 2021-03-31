//
//  FormatItemWithCountInArray.m
//  DataStructureStudy
//
//  Created by jolin on 2021/3/31.
//  Copyright © 2021年 jolin. All rights reserved.
//

#import "FormatItemWithCountInArray.h"

@implementation FormatItemWithCountInArray

- (instancetype)init {
    if (self = [super init]) {
        // [a,b,c,a,b,e,f,a,b,c]
        NSArray<NSString *> * array = @[@"a", @"b", @"c", @"a", @"b", @"e", @"f", @"a", @"b", @"c"];
        NSArray<NSString *> * outputArray = [self formatArrayFromArray:array];
        NSInteger count = outputArray.count;
        printf("\n---------- FormatItemWithCountInArray ---------\n\n");
        printf("[");
        [outputArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            printf(idx == count - 1 ? "%s" : "%s, ", [obj cStringUsingEncoding:NSUTF8StringEncoding]);
        }];
        printf("]\n");
    }
    return self;
}

/**
 * 给定一个字符串数组 [a,b,c,a,b,e,f,a,b,c]
 * 输出如下数组： [a1,b1,c1,a2,b2,e,f,a3,b3,c2]
 *
 */
- (NSArray *)formatArrayFromArray:(NSArray<NSString *> *)array {
    if (!array.count) return nil;
    
    NSMutableArray<NSString *> * outputArray = [NSMutableArray arrayWithCapacity:array.count];
    // 遍历数组，生成对应字符的count和curIdex信息的收集
    NSMutableDictionary<NSString *, NSDictionary<NSString *, NSNumber *> *> * info = [self countAndCurIndexForArray:array];
    
    // 遍历数组，取出字符对应的count来生成格式化的字符串
    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary<NSString *, NSNumber *> * dict = [info[obj] mutableCopy];
        if ([dict[@"count"] integerValue] > 1) {
            // 取curIndex
            NSInteger curIndex = [dict[@"curIndex"] integerValue];
            // 字符串拼上curIndex生成新字符串
            NSString * formatStr = [NSString stringWithFormat:@"%@%zd", obj, curIndex];
            [outputArray addObject:formatStr];
            
            // 更新curIdex的值，并更新到info中
            curIndex ++;
            dict[@"curIndex"] = @(curIndex);
            info[obj] = dict.copy;
        }
        else {
            [outputArray addObject:obj];
        }
    }];
    
    return outputArray;
}


- (NSMutableDictionary *)countAndCurIndexForArray:(NSArray<NSString *> *)array {
    NSInteger count = array.count;
    NSMutableDictionary<NSString *, NSDictionary<NSString *, NSNumber *> *> * info = [NSMutableDictionary dictionaryWithCapacity:count];
    
    [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary<NSString *, NSNumber *> * dict = [info[obj] mutableCopy];
        if (!dict) {
            // 初次时，初始化字典并预设初值
            dict = [NSMutableDictionary dictionaryWithCapacity:count];
            dict[@"count"] = @1;
            dict[@"curIndex"] = @1;
        }
        else {
            // 取出count并更新
            NSInteger count = [dict[@"count"] integerValue];
            count ++;
            dict[@"count"] = @(count);
        }
        info[obj] = dict.copy;
    }];
    
    return info;
}

@end
