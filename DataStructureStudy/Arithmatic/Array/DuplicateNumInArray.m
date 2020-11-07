//
//  DuplicateNumInArray.m
//  MyStudy
//
//  Created by jolin on 2019/10/19.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "DuplicateNumInArray.h"
#import "DJHashMap.h"

@implementation DuplicateNumInArray

- (instancetype)init
{
    if (self = [super init]) {
        
        int array[] = {1, 3, 9, 2, 8, 9, 8, 6, 4, 5, 1};
        int length = sizeof(array) / sizeof(array[0]);
        
        int duplicatedCount = length * 0.5;
        int * duplicated = malloc(sizeof(int) * duplicatedCount);
        memset(duplicated, 0, duplicatedCount);
        
        int count = allDuplicateNumberInArray(array, length, duplicated);
        
        printf("\n------------ DuplicateNumInArray ----------\n\n");
        for (int i = 0; i < count; i ++) {
            printf("%d ", duplicated[i]);
        }
        printf("\n");
        
        free(duplicated);
        
    }
    return self;
}

int allDuplicateNumberInArray(int * array, int length, int * duplicated)
{
    if (!array || length < 1) return 0;
    
    DJHashMap * map = [[DJHashMap alloc] init];

    int p = 0;
    for (int i = 0; i < length; i ++) {
        if ([map objectForKey:array[i]]) {
            duplicated[p++] = array[i];
        }
        else {
            [map setObject:&array[i] forKey:array[i]];
        }
    }
    return p;
}

@end
