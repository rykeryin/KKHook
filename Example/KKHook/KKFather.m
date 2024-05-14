//
//  KKFather.m
//  KKHook_Example
//
//  Created by rykeryin on 2024/5/14.
//  Copyright © 2024 rykeryin. All rights reserved.
//

#import "KKFather.h"
#import <objc/runtime.h>


@implementation KKFather

-(void)call {
    NSLog(@"faterCall");
}

@end



@implementation KKChild

- (void)call {
    NSLog(@"childCall");
//    
    Class class1 = [KKFather class];
    Class class2 = [KKChild class];
    
    SEL originalSelector = @selector(call);
    SEL swizzledSelector = @selector(call);
    
    Method originalMethod = class_getInstanceMethod(class1, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class2, swizzledSelector);   
//    // 交换两个方法的实现
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
    [super call];
    // 交换两个方法的实现
    method_exchangeImplementations(originalMethod, swizzledMethod);
    
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class1 = [KKFather class];
        Class class2 = [KKChild class];
        
        SEL originalSelector = @selector(call);
        SEL swizzledSelector = @selector(call);
        
        Method originalMethod = class_getInstanceMethod(class1, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class2, swizzledSelector);
        
        // 交换两个方法的实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

@end
