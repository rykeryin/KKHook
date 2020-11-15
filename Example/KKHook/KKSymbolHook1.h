//
//  KKSymbolHook.h
//  KKHook
//
//  Created by rykeryin on 2020/11/14.
//  Copyright © 2020 rykeryin. All rights reserved.
//


#import <Dobby/dobby.h>

/// 指定一个可以从 .h 文件导入的方法地址。可用Hopper、IDA等工具查看方法地址
#define KKSymbolHookFileInit(symbol, symbolAddressOffset) \
static UInt64 loadAddress = 0; \
@interface KKSymbolHookFileInit_##symbol: NSObject \
@end \
@implementation KKSymbolHookFileInit_##symbol \
+ (void)load {  \
    loadAddress = (UInt64)((void *)&symbol) - symbolAddressOffset; \
} \
@end

#define KKSymbolHook(rt_type, symbol, ...) \
static rt_type (*orig_##symbol)(__VA_ARGS__); \
rt_type my_##symbol(__VA_ARGS__) \

#define KKSymbolHookAddressRegister(symbol, symbolAddressOffset) \
@interface KKSymbolHookAddressRegister_##symbol: NSObject \
@end \
@implementation KKSymbolHookAddressRegister_##symbol \
+ (void)load {  \
    void *hookAddress = (void *)(loadAddress + symbolAddressOffset);  \
    DobbyHook(hookAddress, (void *)&my_##symbol, (void **)&orig_##symbol); \
} \
@end

#define KKSymbolHookRegister(symbol) \
@interface KKSymbolHookRegister_##symbol: NSObject \
@end \
@implementation KKSymbolHookRegister_##symbol \
+ (void)load {  \
    void *hookAddress = (void *)&symbol; \
    DobbyHook(hookAddress, (void *)&my_##symbol, (void **)&orig_##symbol); \
} \
@end

 

