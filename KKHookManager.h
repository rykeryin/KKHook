//
//  KKHookManager.h
//  Expecta
//
//  Created by rykeryin on 2020/11/11.
//

#import <Foundation/Foundation.h>

#define KKHookedClasses [KKHookManager shared].hookedClasses

#define KKHookedSymbols [KKHookManager shared].hookedSymbols

NS_ASSUME_NONNULL_BEGIN

@class KKSymbol;
@interface KKHookManager : NSObject

@property(atomic, strong) NSMutableArray <KKSymbol *>*hookedSymbols;

@property(atomic, strong) NSMutableArray <Class> *hookedClasses;

+ (instancetype)shared;

- (void)startHook;

@end

NS_ASSUME_NONNULL_END

