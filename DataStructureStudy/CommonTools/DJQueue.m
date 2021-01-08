//
//  DJQueue.m
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "DJQueue.h"

#define kDJQueueSize    10

@interface DJQueue ()
{
    void * _djQueue[kDJQueueSize];
    int _firstIndex;
    int _currentIndex;
    dispatch_semaphore_t _sem;
}
@end

@implementation DJQueue

- (instancetype)init
{
    if (self = [super init]) {
        _sem = dispatch_semaphore_create(1);
        _firstIndex = _currentIndex = 0;
    }
    return self;
}

- (BOOL)empty
{
    return _firstIndex == _currentIndex;
}

- (BOOL)full
{
    return (_currentIndex + 1) % kDJQueueSize == _firstIndex;
}

- (void)enqueue:(void *)obj
{
    if (self.full) {
        printf("queue is full");
        return;
    }
    
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
    _djQueue[_currentIndex] = obj;
    if (_currentIndex == kDJQueueSize - 1) {
        _currentIndex = 0;
    }
    else {
        _currentIndex ++;
    }
    dispatch_semaphore_signal(_sem);
}

- (void *)dequeue
{
    if (self.empty) {
        printf("queue is empty");
        return NULL;
    }
    
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
    void * obj = _djQueue[_firstIndex];
    _djQueue[_firstIndex] = NULL;
    if (_firstIndex == kDJQueueSize - 1) {
        _firstIndex = 0;
    }
    else {
        _firstIndex ++;
    }
    dispatch_semaphore_signal(_sem);
    
    return obj;
}

- (int)size {
    return _currentIndex < _firstIndex ? kDJQueueSize - _firstIndex + _currentIndex : _currentIndex - _firstIndex;
}

@end
