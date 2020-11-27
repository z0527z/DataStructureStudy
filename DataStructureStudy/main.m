//
//  main.m
//  MyStudy
//
//  Created by jolin on 2019/9/30.
//  Copyright © 2019年 jolin. All rights reserved.
//

#import <mach-o/dyld.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <Foundation/Foundation.h>


void generalLoadCls() {
    const char * name = _dyld_get_image_name(0);
    
    struct mach_header_64 * header_64 = (struct mach_header_64 *)_dyld_get_image_header(0);
    if (header_64->magic != MH_MAGIC_64) return;
    // 获取类的个数
    int classNum = objc_getClassList(NULL, 0);
    if (classNum > 0) {
        Class * classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * classNum);
        // 获取到所有的类
        classNum = objc_getClassList(classes, classNum);
        FILE * file = fopen("./1.txt", "w");
        if (!file) return;

        for (int i = 0; i < classNum; i ++) {
            Class c = classes[i];
            
            struct dl_info info = {0};
            dladdr((__bridge void *)c, &info);
            // 过滤到系统的类，取在本工程中新建的类
            if (info.dli_fname != NULL && strstr(info.dli_fname, name)) {
                // 调用类的初始化
                __unused NSObject * obj = [[c alloc] init];
                
                // 将类名写入到文件
                int len = (int)strlen(info.dli_sname);
                fwrite(info.dli_sname, len, 1, file);
                fwrite("\n", 1, 1, file);
            }
        }
        if (file) {
            fclose(file);
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
