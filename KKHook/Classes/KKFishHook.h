//
//  KKFishHook.h
//  KKHook
//
//  Created by rykeryin on 2024/7/29.
//

#import <Foundation/Foundation.h>
#import "fishhook.h"

NS_ASSUME_NONNULL_BEGIN

void ___fishhook_function(const char *symbol, void *replacement, void *_Nonnull*_Nonnull original);

// 宏定义，用于简化函数钩子的使用
#define KKFishHook(return_type, name, ...) \
    static return_type (*original_##name)(__VA_ARGS__); \
    return_type hooked_##name(__VA_ARGS__); \
    @interface ___HookClass_##name : NSObject @end \
    @implementation ___HookClass_##name \
    + (void)load { \
        ___fishhook_function(#name, hooked_##name, (void **)&original_##name); \
    } \
    @end \
    return_type hooked_##name(__VA_ARGS__)


NS_ASSUME_NONNULL_END
