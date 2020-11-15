//
//  KKSharkFishExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/14.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import "KKSharkFishExample.h"
#import "KKSymbolHook1.h"
#import <Shark/Fish.h>

KKSymbolHookFileInit(fishing, 0x0000000000003e90)

KKSymbolHook(void, fishSuccess, void) {
    printf("Dobby 拦截到了 fishSuccess");
    orig_fishSuccess();
}
KKSymbolHookAddressRegister(fishSuccess, 0x0000000000003e30)

//KKSymbolHook(void, fishFail) {
//    printf("Dobby 拦截到了 fishFail");
//    orig_fishFail();
//}
//KKSymbolHookAddressRegister(fishSuccess, 0x0000000000003e30)

KKSymbolHook(void, fishing, int a) {
    printf("Dobby 拦截到了 fishing \n");
    orig_fishing(a);
}
KKSymbolHookRegister(fishing)
