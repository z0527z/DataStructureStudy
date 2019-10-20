//
//  DJHashMap.m
//  MyStudy
//
//  Created by jolin on 2019/10/20.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import "DJHashMap.h"

typedef struct DJHashValue {
    int key;
    void * value;
}DJHashValue;


//

#define kDJHashMapInitialSize      10

@interface DJHashMap ()
{
    DJHashValue ** _djHashMap;
    uint _capacity;
    uint _occupied;
    dispatch_semaphore_t _sem;
}
@end

@implementation DJHashMap

- (instancetype)init
{
    if (self = [super init]) {
        _capacity = kDJHashMapInitialSize;
        _occupied = 0;
        int mallocLength = sizeof(DJHashValue) * _capacity;
        _djHashMap = malloc(mallocLength);
        memset(_djHashMap, 0, mallocLength);
        _sem = dispatch_semaphore_create(1);
    }
    return self;
}

- (uint)count
{
    return _occupied;
}

- (void *)objectForKey:(int)key
{
    if (!key) return NULL;
    
    void * returnValue = NULL;
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
    int index = [self indexOfKey:key];
    int i = index;
    do {
        DJHashValue * value = _djHashMap[i];
        if (!value) {
            break;
        }
        else {
            if (value->key == key) {
                returnValue = value->value;
                break;
            }
        }
    } while ((i = [self nextIndexOfKey:i]) != index);
    
    dispatch_semaphore_signal(_sem);
    
    return returnValue;
}

- (void)setObject:(void *)obj forKey:(int)key
{
    if (!key || !obj) return;
    
    dispatch_semaphore_wait(_sem, DISPATCH_TIME_FOREVER);
    
    if (_occupied < _capacity / 4 * 3) {
        // 小于 3/4 正常使用
    }
    else {
        [self expand];
    }
    
    int index = [self indexOfKey:key];
    int i = index;
    do {
        DJHashValue * value = _djHashMap[i];
        if (value && value->key == key) {
            value->value = obj;
            break;
        }
        else if (!value) {

            DJHashValue * hashValue = malloc(sizeof(DJHashValue));
            hashValue->key = key;
            hashValue->value = obj;
            _djHashMap[index] = hashValue;
            _occupied++;
            break;
        }
    } while ((i = [self nextIndexOfKey:key]) != index);
    
    dispatch_semaphore_signal(_sem);
}

- (void)expand
{
    uint oldCapacity = _capacity;
    uint newCapacity = oldCapacity ? oldCapacity * 2 : kDJHashMapInitialSize;
    
    if ((uint)(uint)newCapacity != newCapacity) {
        // mask overflow - can't grow further
        // fixme this wastes one bit of _capacity
        newCapacity = oldCapacity;
    }
    _capacity = newCapacity;
    _djHashMap = realloc(_djHashMap, sizeof(DJHashValue) * newCapacity);
    
}

- (int)indexOfKey:(int)key
{
    return (int)(key % _capacity);
}

- (int)nextIndexOfKey:(int)key
{
    return (int)(key + 1) % _capacity;
}

@end
