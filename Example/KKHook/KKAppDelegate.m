//
//  KKAppDelegate.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import "KKAppDelegate.h"
#import <Dobby/dobby.h>
#import <KKHook.h>
#import "KKViewController.h"
#import "Fish.h"

@implementation KKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    fishing(100);
    
    return YES;
}

@end






//KKClassHookUnImported(KKViewController)
//- (void)hook2_viewDidLoad {
//    printf("KKViewController viewDidLoad hooked 2 \n");
//    [self hook2_viewDidLoad];
//}
//KKClassHookEnd(KKViewController)
//


//static UInt64 flagStaticAddress;
//static UInt64 flagDynamicAddress;


//static void KKAddressHookInit(UInt64 frameworkStartAddress) {
//
//}




//KKAddressHookInit(fish, 0x0000000000003f40)


//@interface KKAddressHookRegiser_fish: NSObject
//@end
//@implementation KKAddressHookRegiser_fish
//- (void)load {
////    void *f = (void *)&fish;
////    frameworkStartAddress = (UInt64)((void *)&test) - 0x0000000000003f40;
//}
//@end

//KKAddressHook(void, fishSuccess) {
//    printf("xxxxx");
//}
//KKAddressHookRegister(fishSuccess, 0x0000000000003f20)


