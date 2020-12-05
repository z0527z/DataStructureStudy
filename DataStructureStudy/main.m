//
//  main.m
//  MyStudy
//
//  Created by jolin on 2019/9/30.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import <mach-o/dyld.h>
#import <objc/runtime.h>
#import <mach-o/getsect.h>
#import <Foundation/Foundation.h>


void generalLoadCls() {
    const char * name = _dyld_get_image_name(0);
    
    struct mach_header_64 * header_64 = (struct mach_header_64 *)_dyld_get_image_header(0);
    if (header_64->magic != MH_MAGIC_64) return;
    
    unsigned long byte = 0;
    void * classList = getsectiondata((void *)header_64, "__DATA", "__objc_classlist", &byte);
    Class * clsList = (Class *)classList;
    unsigned long count = byte / sizeof(Class);
    for (unsigned long j = 0; j < count; j ++) {
        Class cls = clsList[j];
        if (![NSStringFromClass(cls) hasPrefix:@"DJ"]) {
            __unused id unused = [[cls alloc] init];
        }
    }
}

__attribute__((constructor(5))) void preMainFunc (void) {
    printf("main前调用，还可以指定 constructor的优先级\n");
}

int main(int argc, const char * argv[]) {
    
    generalLoadCls();

    printf("\n");
    return 0;
}
