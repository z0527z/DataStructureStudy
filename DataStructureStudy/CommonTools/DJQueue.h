//
//  DJQueue.h
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJQueue : NSObject

- (void)enqueue:(void *)obj;

- (void *)dequeue;

- (BOOL)empty;

- (int)size;

@end
