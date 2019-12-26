//
//  DJStack.h
//  MyStudy
//
//  Created by jolin on 2019/10/1.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJStack : NSObject

- (void)push:(void *)obj;

- (void *)pop;

- (BOOL)empty;

@end
