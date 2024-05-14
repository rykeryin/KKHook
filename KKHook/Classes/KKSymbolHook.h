//
//  KKSymbolHook.h
//  KKHook
//
//  Created by rykeryin on 2020/11/17.
//

#import <Foundation/Foundation.h>

@interface ___PrivatePrivateHookCore : NSObject
+ (int)hook:(const char *)image symbolName:(const char *)symbol replace:(void *)replace_call origin:(void **)origin_call;
@end

#define KKSymbolHookInitMachO(imageName) const char *image = #imageName;

#define KKSymbolHook(rt_type, symbol, ...) \
static rt_type (*orig_##symbol)(__VA_ARGS__); \
static rt_type my_##symbol(__VA_ARGS__); \
@implementation ___PrivatePrivateHookCore(symbol) \
+ (void)load {  \
    printf("\n*************************\n😄 Register Symbol Hook: %s\n************************\n\n", #symbol); \
    [self hook:image symbolName:#symbol replace:(void *)&my_##symbol origin:(void **)&orig_##symbol]; \
} \
@end \
rt_type my_##symbol(__VA_ARGS__)


#define KKSymbolHookWithMachO(image,rt_type, symbol, ...) \
static rt_type (*orig_##symbol)(__VA_ARGS__); \
static rt_type my_##symbol(__VA_ARGS__); \
@implementation ___PrivatePrivateHookCore(symbol) \
+ (void)load {  \
    printf("\n*************************\n😄 Register Symbol Hook: %s\n************************\n\n", #symbol); \
[self hook:#image symbolName:#symbol replace:(void *)&my_##symbol origin:(void **)&orig_##symbol]; \
} \
@end \
rt_type my_##symbol(__VA_ARGS__)



