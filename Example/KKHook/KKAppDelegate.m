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
#import "KKFather.h"
#import <AVKit/AVKit.h>
#import "fishhook.h"



@implementation KKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    [[KKFather new] call];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    fishing(100);
    
    printf("今天天气好，适合摸鱼");
    
    CFTypeRef cf = CFAllocatorGetDefault();
    CFRetain(cf);
    
    return YES;
}

@end

//KKAddressHookFileInit(UIKit)

