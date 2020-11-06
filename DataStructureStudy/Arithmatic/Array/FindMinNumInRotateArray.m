//
//  FindMinNumInRotateArray.m
//  DataStructureStudy
//
//  Created by jolin.ding on 2020/11/3.
//  Copyright © 2020 jolin. All rights reserved.
//

#import "FindMinNumInRotateArray.h"

@implementation FindMinNumInRotateArray

- (instancetype)init {
    if (self = [super init]) {
        int array[] = {3, 4, 5, 1, 2};
        int length = sizeof(array) / sizeof(array[0]);
        findMinNumInRotateArray(array, length);
        
    }
    return self;
}

void findMinNumInRotateArray(int * array, int length) {
    
}

@end
