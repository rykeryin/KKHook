//
//  CHook.h
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <dlfcn.h>
#import "KKSymbol.h"
#import "KKHookManager.h"

#define KKSymbolHook(rt_type, symbol, ...) \
static rt_type (*orig_##symbol)(__VA_ARGS__); \
rt_type my_##symbol(__VA_ARGS__)


#define KKSymbolHookRegister(symbol) \
@interface symbol##Hooker: NSObject \
@end \
@implementation symbol##Hooker \
+ (void)load { \
KKSymbol *symbol##_ = [[KKSymbol alloc] init]; \
    symbol##_.name = #symbol; \
    symbol##_.replacement = (void *)my_##symbol; \
    symbol##_.replaced = (void **)&orig_##symbol; \
    [KKHookedSymbols addObject:symbol##_]; \
} \
@end \

