//
//  Hook.h
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#define OCHookClassImported(clsz) \
@implementation clsz(add) \
+ (void)load { \
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) { \
        NSLog(@"class %@ hooked", [clsz class]); \
        unsigned int mothCout_f =0; \
        Method* mothList_f = class_copyMethodList([clsz class],&mothCout_f); \
        NSMutableSet *methods = [[NSMutableSet alloc] init]; \
        for(int i=0;i<mothCout_f;i++) \
         { \
            Method method = mothList_f[i];\
            SEL m_sel = method_getName(method);\
            NSString *methodName = NSStringFromSelector(m_sel);\
             if([methodName hasPrefix:@"hook"]) {\
                 if([methods containsObject:methodName]) { \
                    NSLog(@"\n\n\n========= 方法名重复: %@ ========\n\n\n", methodName); \
                    raise(9); \
                 } \
                 [methods addObject:methodName]; \
                 NSString *oriMethodName = [methodName componentsSeparatedByString:@"_"][1];\
                 Method oriMethod = class_getInstanceMethod([clsz class], NSSelectorFromString(oriMethodName));\
                 method_exchangeImplementations(method, oriMethod);\
             }\
         }\
        free(mothList_f);\
    }]; \
}

#define OCHookClassUnImported(clsz) \
@interface clsz: NSObject \
@end \
OCHookClassImported(clsz)

#define OCHookClassEnd @end
