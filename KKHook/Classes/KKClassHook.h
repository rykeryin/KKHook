//
//  Hook.h
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kkhook(methodName) kkhook_#methodName

#define KKClassHookImported(clsz) \
@implementation clsz(add) \
+ (void)load { \
    KKHookClass([self class]); \
}

//#define KKClassHookUnImported(clsz) \
//@interface clsz: NSObject \
//@end \
//KKClassHookImported(clsz)
//
#define KKClassHook(methodName) hook_##methodName

#define KKClassHookEnd  @end


// clsz 是需要 hook 的类名
#define KKClassHookUnImported(clsz) \
@interface InvisibleHook__##clsz: NSObject \
@end \
@implementation InvisibleHook__##clsz \
+ (void)load { \
KKHookClass([self class]); \
} \

extern void KKHookClass(Class claz);





