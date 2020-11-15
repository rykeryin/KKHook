//
//  KKSymbolHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/15.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import <KKHook.h>
#import "Fish.h"

KKSymbolHook(int, fishing, int food) {
    return orig_fishing(food);
}
KKSymbolHookRegister(fishing)

