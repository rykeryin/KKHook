//
//  KKAppDelegate.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import "KKAppDelegate.h"
#import <KKHook/KKHook.h>
#import <Dobby/dobby.h>
#import <Shark/Fish.h>






typedef void(*FunctionPointer)(...);

@implementation KKAppDelegate

//FOUNDATION_EXPORT void NSLog(NSString *format, ...) {
//
//}

void PreCallTy1(RegisterContext *reg_ctx, const HookEntryInfo *info) {
//    printf("%llu", reg_ctx->general.regs.x0);
}

void PostCallTy1(RegisterContext *reg_ctx, const HookEntryInfo *info) {
    
}

void test() {
    printf("test");
}

void test2() {
    printf("test2");
}

//int DobbyWrap(void *function_address, PreCallTy pre_call, PostCallTy post_call);


//typedef void (*DBICallTy)(RegisterContext *reg_ctx, const HookEntryInfo *info);
void DBICallTy11(RegisterContext *reg_ctx, const HookEntryInfo *info) {
    printf("%llu", reg_ctx->general.regs.r8);
    printf("target_address: %p\n", info->target_address);
    printf("target_address: %p\n", info->function_address);
    printf("target_address: %p\n", info->instruction_address);
    printf("all");
}

void (*orig_NSLog)(NSString *format, ...);

void my_NSLog(NSString *format, ...) {
    printf("my_NSLog\n");
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    KKHookInit
    
    printf("%s", DobbyBuildVersion());
    
//    void *f = (void *)&NSLog;
    
//    DobbyHook((void *)((long)f + 0x70), (void *)&my_NSLog, (void **)&orig_NSLog);
    test2();
//    fishing(100);
//    void *hack_this_function_ptr = (void *)NSLog;
//
//    DobbyInstrument(hack_this_function_ptr, &DBICallTy11);
//
//    DobbySymbolResolver("KKHook", "test");
    
//    a(123);
    
    NSLog(@"yin%@", @"xukun");
    
//    const char *food = "nothing";
//
    
    return YES;
}

@end

KKClassHookUnImported(KKViewController)
- (void)hook2_viewDidLoad {
    printf("KKViewController viewDidLoad hooked 2 \n");
    [self hook2_viewDidLoad];
}
KKClassHookEnd
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


