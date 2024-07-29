//
//  KKViewController.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import "KKViewController.h"
#import <AVKit/AVKit.h>


@interface KKViewController ()

@end

@implementation KKViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    static AVPlayer *player;
    player = [[AVPlayer alloc] init];
    [player play];
//    fishing(100);
    self.view.backgroundColor = [UIColor redColor];
//    void *f = fishing;
    
    if (!fopen("", "")) {
        printf("Open file failed!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//static UInt64 frameworkStartAddress = 0;
//#define KKAddressHookInit(flag, flagStaticAddress) \
//@interface KKAddressHookRegiser_##flag: NSObject \
//@end \
//@implementation KKAddressHookRegiser_##flag \
//+ (void)load {  \
//    frameworkStartAddress = (UInt64)((void *)&flag) - flagStaticAddress; \
//} \
//@end

//#define KKAddressHook(rt_type, symbol, ...) \
//static rt_type (*orig_##symbol)(__VA_ARGS__); \
//rt_type my_##symbol(__VA_ARGS__) \
//
//#define KKAddressHookRegister(symbol, address) \
//@interface KKAddressHookRegiser_##symbol: NSObject \
//@end \
//@implementation KKAddressHookRegiser_##symbol \
//+ (void)load {  \
//    DobbyHook((void *)(frameworkStartAddress + address), (void *)&my_##symbol, (void **)&orig_##symbol); \
//} \
//@end


//KKAddressHookInit(fishing, 0x0000000000003e90)
//
//KKAddressHook(void, fishSuccess) {
//    printf("Dobby 拦截到了 fishSuccess");
//    orig_fishSuccess();
//}
//KKAddressHookRegister(fishSuccess, 0x0000000000003e30)


//KKSymbolHook(void, fishing, int a) {
//    printf("FishHook 拦截到了 fishing \n");
//}
//KKSymbolHookRegister(fishing)

//KKSymbolHook(void, fishSuccess) {
//    printf("FishHook 拦截到了 fishSuccess \n");
//}
//KKSymbolHookRegister(fishSuccess)
             
