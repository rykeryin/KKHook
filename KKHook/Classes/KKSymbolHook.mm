//
//  KKSymbolHook.m
//  KKHook
//
//  Created by rykeryin on 2020/11/15.
//

#import "KKSymbolHook.h"
#import <Dobby/dobby.h>

@implementation KKDobbyHook
+ (int)hook:(void *)function_address replace:(void *)replace_call origin:(void **)origin_call {
    return DobbyHook(function_address, replace_call, origin_call);
}
@end
