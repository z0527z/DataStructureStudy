//
//  DJHashMap.h
//  MyStudy
//
//  Created by jolin on 2019/10/20.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DJHashMap : NSObject

- (uint)count;

- (void *)objectForKey:(int)key;

- (void)setObject:(void *)obj forKey:(int)key;

@end
