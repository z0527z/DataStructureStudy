//
//  DJStack.m
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "DJStack.h"

#define kDJStackSize    20

@interface DJStack ()
{
    void * _djStack[kDJStackSize];
    int _currentIdx;
    dispatch_semaphore_t _sem;
}
@end

@implementation DJStack

- (instancetype)init
{
    if (self = [super init]) {
        _sem = dispatch_semaphore_create(1);
        _currentIdx = 0;
    }
    return self;
}

- (BOOL)isFull
{
    return _currentIdx >= kDJStackSize - 1;
}

- (BOOL)empty
{
    return _currentIdx == 0;
}

- (void)push:(void *)obj
{
    if (self.isFull) {
        printf("stack over flow");
        return;
    }
    
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
    _djStack[_currentIdx++] = obj;
    dispatch_semaphore_signal(_sem);
}

- (void *)pop
{
    if (self.empty) return NULL;
    
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
    int index = --_currentIdx;
    void * obj = _djStack[index];
    _djStack[index] = NULL;
    dispatch_semaphore_signal(_sem);
    
    return obj;
}

@end
