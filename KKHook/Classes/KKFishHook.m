//
//  KKFishHook.m
//  KKHook
//
//  Created by rykeryin on 2024/7/29.
//

#import "KKFishHook.h"
#import "fishhook.h"

void ___fishhook_function(const char *symbol, void *replacement, void *_Nonnull*_Nonnull original) {
    struct rebinding rebind;
    rebind.name = symbol;
    rebind.replacement = replacement;
    rebind.replaced = original;
    struct rebinding rebindings[] = {rebind};
    rebind_symbols(rebindings, 1);
}

