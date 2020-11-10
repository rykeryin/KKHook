//
//  CHook.m
//  TRTCSimpleDemo
//
//  Created by rykeryin on 2020/11/9.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "CHook.h"
#import <objc/runtime.h>

@implementation rebinding_obj
- (struct rebinding)gen_struct {
    return (struct rebinding){
        self.name,
        self.replacement,
        self.replaced
    };
}
@end

@implementation FishhookStarter

+ (instancetype)shared {    
    static FishhookStarter *f = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        f = [[FishhookStarter alloc] init];
        f.obj_rebindings = [[NSMutableArray alloc] initWithCapacity:10];
    });
    return f;
}

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        if (rebinding_objs.count <= 0) {
            return;
        }
        struct rebinding *struct_rebindings = malloc(rebinding_objs.count * sizeof(struct rebinding));
        for (int i=0; i<rebinding_objs.count; i++) {
            struct_rebindings[i] = [rebinding_objs[i] gen_struct];
        }
        rebind_symbols((struct rebinding *)struct_rebindings, rebinding_objs.count);
        int fd = open([[NSProcessInfo alloc].arguments[0] cStringUsingEncoding:NSUTF8StringEncoding], O_RDONLY);
        uint32_t magic_number = 0;
        read(fd, &magic_number, 4);
        printf("Mach-O Magic Number: %x \n", magic_number);
        close(fd);
    }];
}
@end



