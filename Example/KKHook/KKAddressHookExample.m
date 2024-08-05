//
//  KKAddressHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/15.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import <KKHook/KKAddressHook.h>
#import "Fish.h"

KKAddressHookWithMachO(TestMachO, 0x0000000000004000, int, fishSuccess, int a) {
    return orig_fishSuccess(a);
}
