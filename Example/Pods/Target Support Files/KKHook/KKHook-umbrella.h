#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "fishhook.h"
#import "KKClassHook.h"
#import "KKHook.h"
#import "KKHookManager.h"
#import "KKSymbol.h"
#import "KKSymbolHook.h"

FOUNDATION_EXPORT double KKHookVersionNumber;
FOUNDATION_EXPORT const unsigned char KKHookVersionString[];

