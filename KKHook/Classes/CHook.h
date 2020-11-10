//
//  CHook.h
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <dlfcn.h>
#import "fishhook.h"

#define CHookMethod(rt_type, m_name, ...) \
static rt_type (*orig_##m_name)(__VA_ARGS__); \
rt_type my_##m_name(__VA_ARGS__)


@class rebinding_obj;
@interface rebinding_obj : NSObject
@property (nonatomic, assign) const char *name;
@property (nonatomic, assign) void *replacement;
@property (nonatomic, assign) void **replaced;
- (struct rebinding)gen_struct;
@end

@interface FishhookStarter : NSObject
@property(atomic, strong) NSMutableArray <rebinding_obj *>*obj_rebindings;
+ (instancetype)shared;
@end

#define rebinding_objs [FishhookStarter shared].obj_rebindings

#define CHookMethodRegister(method) \
@interface Hook_##method##_Obj: rebinding_obj \
@end \
@implementation Hook_##method##_Obj \
+ (void)load { \
    printf("hook method:%s\n", #method);  \
    rebinding_obj *method##_rebinding_obj = [[rebinding_obj alloc] init]; \
    method##_rebinding_obj.name = #method; \
    method##_rebinding_obj.replacement = (void *)my_##method; \
    method##_rebinding_obj.replaced = (void **)&orig_##method; \
    [rebinding_objs addObject:method##_rebinding_obj]; \
    NSLog(@"obj_rebindings: %@", rebinding_objs); \
} \
@end \

//extern void fish_hook_init(char * argv[]);

