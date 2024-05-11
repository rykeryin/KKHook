//
//  KKSymbolHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/15.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import "Fish.h"
#import <objc/message.h>
#import <KKHook/KKSymbolHook.h>
#import <AVFoundation/AVFoundation.h>

KKSymbolHookMachO(TestMachO)

KKSymbolHook(int, fishSuccess, void) {
    printf("fishSuccess hooked");
    return orig_fishSuccess();
}
//KKSymbolHookRegister(fishSuccess)



