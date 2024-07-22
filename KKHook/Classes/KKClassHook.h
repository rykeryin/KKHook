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

#define KKClassHookUnImported(clsz) \
@interface clsz: NSObject \
@end \
KKClassHookImported(clsz)

#define KKClassHook(methodName) hook_##methodName

#define KKClassHookEnd  @end


extern void KKHookClass(Class claz);





