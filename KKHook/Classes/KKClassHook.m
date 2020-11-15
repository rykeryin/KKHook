
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

void KKHookClass(Class claz) {
    NSLog(@"\n\n*************************\n😄 Class Hook: %@\n************************\n", claz); \
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
