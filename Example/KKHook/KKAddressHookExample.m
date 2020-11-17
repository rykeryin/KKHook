//
//  KKAddressHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/15.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import <KKHook/KKAddressHook.h>
#import "Fish.h"
/*
_fishing:
0000000000003e80         push       rbp
0000000000003e81         mov        rbp, rsp
0000000000003e84         sub        rsp, 0x10

_fishSuccess:
0000000000003e20         push       rbp                                         ; CODE XREF=_fishing+35
0000000000003e21         mov        rbp, rsp
0000000000003e24         sub        rsp, 0x10

_fishFail:
0000000000003e50         push       rbp                                         ; CODE XREF=_fishing+48
0000000000003e51         mov        rbp, rsp
0000000000003e54         sub        rsp, 0x10
*/


KKAddressHookFileInit(TestMachO)

KKAddressHook(int, fishSuccess, void) {
    return orig_fishSuccess();
}
KKAddressHookRegister(fishSuccess, 0x0000000000007e30)
