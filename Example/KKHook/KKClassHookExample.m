//
//  KKHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/11.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import <KKHook.h>
#import "KKViewController.h"


KKClassHookUnImported(KKAppDelegate)

- (BOOL)hook_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [self hook_application:application didFinishLaunchingWithOptions:launchOptions];
}

KKClassHookEnd

KKClassHookImported(KKViewController)

- (void)hook_viewDidLoad {
    [self hook_viewDidLoad];
}

KKClassHookEnd


