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

//KKAddressHookFileInit(UIKit)

