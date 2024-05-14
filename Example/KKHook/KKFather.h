//
//  KKFather.h
//  KKHook_Example
//
//  Created by rykeryin on 2024/5/14.
//  Copyright © 2024 rykeryin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKFather : NSObject

- (void)call;

@end

@interface KKChild : KKFather

- (void)call;

@end

NS_ASSUME_NONNULL_END
