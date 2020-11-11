//
//  Hook.h
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "KKHookManager.h"

#define KKClassHookImported(clsz) \
@implementation clsz(add) \
+ (void)load { \
     [KKHookedClasses addObject:[clsz class]]; \
}

#define KKClassHookUnImported(clsz) \
@interface clsz: NSObject \
@end \
KKClassHookImported(clsz)

#define KKClassHookEnd @end
