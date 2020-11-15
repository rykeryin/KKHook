//
//  CHook.h
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 指定一个可以从 .h 文件导入的方法地址。可用Hopper、IDA等工具查看方法地址
#define KKAddressHookFileInit(symbol, symbolAddressOffset) \
static UInt64 loadAddress = 0; \
@interface KKAddressHookFileInit_##symbol: NSObject \
@end \
@implementation KKAddressHookFileInit_##symbol \
+ (void)load {  \
    loadAddress = (UInt64)((void *)&symbol) - symbolAddressOffset; \
} \
@end

#define KKSymbolHook(rt_type, symbol, ...) \
static rt_type (*orig_##symbol)(__VA_ARGS__); \
rt_type my_##symbol(__VA_ARGS__)

#define KKSymbolHookRegister(symbol) \
@interface KKSymbolHookRegister_##symbol: NSObject \
@end \
@implementation KKSymbolHookRegister_##symbol \
+ (void)load {  \
    printf("\n*************************\n😄 Symbol Hook: %s\n************************\n\n", #symbol); \
    void *hookAddress = &symbol; \
    [KKDobbyHook hook:hookAddress replace:(void *)&my_##symbol origin:(void **)&orig_##symbol]; \
} \
@end

#define KKAddressHook(rt_type, symbol, ...) \
static rt_type (*orig_##symbol)(__VA_ARGS__); \
rt_type my_##symbol(__VA_ARGS__)

#define KKAddressHookRegister(symbol, symbolAddressOffset) \
@interface KKAddressHookRegister_##symbol: NSObject \
@end \
@implementation KKAddressHookRegister_##symbol \
+ (void)load {  \
    printf("\n*************************\n😄 Address Hook: %s\n************************\n\n", #symbol); \
    void *hookAddress = (void *)(loadAddress + symbolAddressOffset);  \
    [KKDobbyHook hook:hookAddress replace:(void *)&my_##symbol origin:(void **)&orig_##symbol]; \
} \
@end


//KKDobbyHook(hookAddress, (void *)&my_##symbol, (void **)&orig_##symbol);
@interface KKDobbyHook: NSObject
+ (int)hook:(void *)function_address replace:(void *)replace_call origin:(void **)origin_call;
@end


