//
//  KKHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/11.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import <KKHook/KKFishHook.h>
#import <KKHook/KKClassHook.h>
#import <KKHook/KKAddressHook.h>
#import <KKHook/KKSymbolHook.h>
#import <UIKit/UIKit.h>
#import <AVFAudio/AVFAudio.h>

#import "KKViewController.h"

// 已导入类hook，优先使用，有代码提示
KKClassHookImported(KKViewController)
- (void)hook_viewDidLoad {
    [self hook_viewDidLoad];
}
KKClassHookEnd

// 未导入类Hook，比如 hook 的 ipa 中的类，肯定是 hook 不到的
KKClassHookUnImported(UIView)
- (void)hook_setBackgroundColor:(UIColor *)color {
    [self hook_setBackgroundColor:color];
}
KKClassHookEnd

// 符号Hook，参数：需要hook的包、返回值、函数名，参数
KKSymbolHookWithMachO(TestMachO, int, fishSuccess, void) {
    printf("fishSuccess hooked");
    return orig_fishSuccess();
}
//// 地址Hook，参数：需要hook的包、返回值、地址，参数
//KKAddressHookWithMachO(TestMachO, 0x0000000000004000, int, fishSuccess, int a) {
//    return orig_fishSuccess(a);
//}
//// PLT表hook，参数：需要hook的包、返回值、地址，参数
//KKFishHook(int, printf, const char* format, ...) {
//    va_list args;
//    va_start(args, format);
//    int ret = vprintf(format, args);
//    va_end(args);
//    // 这里可以添加自定义代码，例如日志记录
//    return ret;
//}
