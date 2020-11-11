//
//  KKHookExample.m
//  KKHook_Example
//
//  Created by rykeryin on 2020/11/11.
//  Copyright © 2020 rykeryin. All rights reserved.
//

#import <KKHook/KKHook.h>
#import <UIKit/UIKit.h>

// Example: Hook UnImported KKViewController
KKClassHookUnImported(KKViewController)
- (void)hook1_viewDidLoad {
    printf("KKViewController viewDidLoad hooked 1 \n");
    [self hook1_viewDidLoad];
}
KKClassHookEnd

// Example: Hook Imported UIViewController
KKClassHookImported(UIViewController)
- (void)hook_viewWillAppear:(BOOL)animated {
    printf("\nUIViewController viewWillAppear hooked\n");
}
- (void)hook_viewDidLoad {
    printf("UIViewController viewDidLoad hooked\n");
}
KKClassHookEnd

// Example: Hook fopen
KKSymbolHook(FILE *, fopen, const char * __restrict __filename, const char * __restrict __mode) {
    printf("fopen hooked\n");
    return orig_fopen(__filename, __mode);
}
KKSymbolHookRegister(fopen);
