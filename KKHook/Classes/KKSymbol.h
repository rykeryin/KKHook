//
//  KKSymbol.h
//  Expecta
//
//  Created by rykeryin on 2020/11/11.
//

#import <Foundation/Foundation.h>
#import "fishhook.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKSymbol : NSObject

@property (nonatomic, assign) const char *name;
@property (nonatomic, assign) void *replacement;
@property (nonatomic, assign) void *_Nullable* _Nullable replaced;

- (struct rebinding)genStruct;

@end

NS_ASSUME_NONNULL_END
