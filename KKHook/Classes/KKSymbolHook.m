//
//  KKSymbolHook.m
//  KKHook
//
//  Created by rykeryin on 2020/11/17.
//

#import "KKSymbolHook.h"
#import <Dobby/dobby.h>

@implementation KKSymbolHook

+ (int)hook:(const char *)image symbolName:(const char *)symbol replace:(void *)replace_call origin:(void **)origin_call {
    void *function_address = DobbySymbolResolver(image, symbol);
    return DobbyHook(function_address, replace_call, origin_call);
}

@end

