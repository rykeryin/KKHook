//
//  KKAppDelegate.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import "KKAppDelegate.h"
#import <KKHook/KKHook.h>

@implementation KKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    KKHookInit
    return YES;
}

@end

KKClassHookUnImported(KKViewController)
- (void)hook2_viewDidLoad {
    printf("KKViewController viewDidLoad hooked 2 \n");
    [self hook2_viewDidLoad];
}
KKClassHookEnd
