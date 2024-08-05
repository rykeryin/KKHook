//
//  main.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

@import UIKit;
#import "KKAppDelegate.h"
#import "fishhook.h"

// 定义一个函数指针类型来保存原始的 objc_msgSend
static void (*orig_objc_msgSend)(id, SEL, ...);

// 定义我们的自定义 objc_msgSend
void my_objc_msgSend(id self, SEL _cmd, ...) {
    NSLog(@"Called method: %@", NSStringFromSelector(_cmd));

    // 调用原始的 objc_msgSend
    va_list args;
    va_start(args, _cmd);

    // 使用类型转换确保调用原始的 objc_msgSend
    ((void (*)(id, SEL, ...))orig_objc_msgSend)(self, _cmd, args);

    va_end(args);
}

int main(int argc, char * argv[])
{
////        // 重新绑定 objc_msgSend
//           struct rebinding objc_msgSend_rebinding = {"objc_msgSend", (void *)my_objc_msgSend, (void *)&orig_objc_msgSend};
//           struct rebinding rebindings[] = {objc_msgSend_rebinding};
//           rebind_symbols(rebindings, 1);
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([KKAppDelegate class]));
    }
}
