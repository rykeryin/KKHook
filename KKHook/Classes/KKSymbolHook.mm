//
//  KKSymbolHook.m
//  KKHook
//
//  Created by rykeryin on 2020/11/15.
//

#import "KKSymbolHook.h"
#import "dobby.h"

#include <stdio.h>
#include <dlfcn.h>
#include <mach-o/dyld_images.h>
#include <mach-o/dyld.h>

@implementation KKDobbyHook
+ (int)hook:(void *)function_address replace:(void *)replace_call origin:(void **)origin_call {
    return DobbyHook(function_address, replace_call, origin_call);
}

+ (UInt64)readImageAddress:(NSString *)imageName {
    // Get DYLD task infos
    struct task_dyld_info dyld_info;
    mach_msg_type_number_t count = TASK_DYLD_INFO_COUNT;
    kern_return_t ret;
    ret = task_info(mach_task_self_,
                    TASK_DYLD_INFO,
                    (task_info_t)&dyld_info,
                    &count);
    if (ret != KERN_SUCCESS) {
//        return NULL;
    }
    // Get image array's size and address
    mach_vm_address_t image_infos = dyld_info.all_image_info_addr;
    struct dyld_all_image_infos *infos;
    infos = (struct dyld_all_image_infos *)image_infos;
    uint32_t image_count = infos->infoArrayCount;
    struct dyld_image_info * image_array =( struct dyld_image_info *)infos->infoArray;
    struct dyld_image_info * image;
    for (int i = 0; i < image_count; ++i)
    {
        image = image_array + i;
        NSString * imagePath = [NSString stringWithUTF8String:image->imageFilePath];
        if([imagePath rangeOfString:imageName].location!=NSNotFound)
        {
            return (UInt64)(image->imageLoadAddress);
        }
    }
    return 0;
}
@end

