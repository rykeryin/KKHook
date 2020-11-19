#import "KKAppDelegate.h"
#import <KKHook/KKClassHook.h>

KKClassHookImportedKKAppDelegate

- (BOOL)hook_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    return [self hook_touchesBegan:touches withEvent:event];
}
- (void)hook_touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self hook_touchesMoved:touches withEvent:event];
}
- (void)hook_touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self hook_touchesEnded:touches withEvent:event];
}

KKClassHookEnd