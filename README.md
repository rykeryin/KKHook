# KKHook

[![CI Status](https://img.shields.io/travis/rykeryin/KKHook.svg?style=flat)](https://travis-ci.org/rykeryin/KKHook)
[![Version](https://img.shields.io/cocoapods/v/KKHook.svg?style=flat)](https://cocoapods.org/pods/KKHook)
[![License](https://img.shields.io/cocoapods/l/KKHook.svg?style=flat)](https://cocoapods.org/pods/KKHook)
[![Platform](https://img.shields.io/cocoapods/p/KKHook.svg?style=flat)](https://cocoapods.org/pods/KKHook)

## Example

Simple two - step hooks for the OC method and symbol

1. Init Hooker
```Object-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    KKHookInit
    return YES;
}
```
2. Hook Example
```Object-C
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
```

## Requirements

## Installation

KKHook is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KKHook'
```

## Author

rykeryin, rykeryin@163.com

## License

KKHook is available under the MIT license. See the LICENSE file for more info.


