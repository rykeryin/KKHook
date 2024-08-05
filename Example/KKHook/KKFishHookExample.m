//
//  KKFishHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2024/7/29.
//  Copyright © 2024 rykeryin. All rights reserved.
//

#import <KKHook/KKFishHook.h>
#import <objc/message.h>
#import <KKHook/KKFishHook.h>

KKFishHook(int, printf, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int ret = vprintf(format, args);
    va_end(args);
    // 这里可以添加自定义代码，例如日志记录
    return ret;
}

