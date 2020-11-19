//
//  KKAppDelegate.h
//  TRTC
//
//  Created by rykeryin on 11/16/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (BOOL)touchesBegan:(NSSet<UITouch *> *)touches
withEvent:(nullable UIEvent *)event;
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event;

@end
