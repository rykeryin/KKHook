//
//  KKHookManager.m
//  Expecta
//
//  Created by rykeryin on 2020/11/11.
//

#import "KKHookManager.h"
#import <objc/runtime.h>
#import "KKSymbol.h"

@implementation KKHookManager

+ (instancetype)shared {
    static KKHookManager *shared = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shared = [[KKHookManager alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        self.hookedSymbols = [[NSMutableArray alloc] initWithCapacity:10];
        self.hookedClasses = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

- (void)startHookSymbols {
    long hookedSymbolsCount = KKHookedSymbols.count;
    if (hookedSymbolsCount <= 0) {
        return;
    }
    struct rebinding *rebindings = malloc(hookedSymbolsCount * sizeof(struct rebinding));
    for (int i=0; i < hookedSymbolsCount; i++) {
        rebindings[i] = [KKHookedSymbols[i] genStruct];
    }
    rebind_symbols((struct rebinding *)rebindings, hookedSymbolsCount);
    
    int fd = open([[NSProcessInfo alloc].arguments[0] cStringUsingEncoding:NSUTF8StringEncoding], O_RDONLY);
    uint32_t magic_number = 0;
    read(fd, &magic_number, 4);
    printf("Mach-O Magic Number: %x \n", magic_number);
    close(fd);
}

- (void)startHookClasses {
    for (Class claz in KKHookedClasses) {
        unsigned int mothCout_f =0;
        Method* mothList_f = class_copyMethodList(claz, &mothCout_f);
        NSMutableSet *methods = [[NSMutableSet alloc] init];
        for(int i=0;i<mothCout_f;i++)
         {
            Method method = mothList_f[i];
            SEL m_sel = method_getName(method);
            NSString *methodName = NSStringFromSelector(m_sel);
             if([methodName hasPrefix:@"hook"]) {
                 if([methods containsObject:methodName]) {
                    NSLog(@"\n\n\n========= 方法名重复: %@ ========\n\n\n", methodName);
                    raise(9);
                 }
                 [methods addObject:methodName];
                 NSString *oriMethodName = [methodName componentsSeparatedByString:@"_"][1];
                 Method oriMethod = class_getInstanceMethod(claz, NSSelectorFromString(oriMethodName));
                 method_exchangeImplementations(method, oriMethod);
             }
         }
        free(mothList_f);
    }
}

- (void)startHook {
    [self startHookClasses];
    [self startHookSymbols];
}

@end
