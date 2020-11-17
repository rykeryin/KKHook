//
//  KKAppDelegate.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import "KKAppDelegate.h"
#import "KKViewController.h"
#import "Fish.h"

@implementation KKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    fishing(100);
    
    return YES;
}

@end
//
//KKAddressHookFileInit(TestMachO, 2)
//
//KKAddressHook(int, fishSuccess2, void) {
//    return orig_fishSuccess2();
//}
//KKAddressHookRegister(fishSuccess2, 0x0000000000007e30)

