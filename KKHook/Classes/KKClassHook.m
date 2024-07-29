
#import <Foundation/Foundation.h>
#import <objc/runtime.h>


void KKHookMethodAdd(Class claz, Class oriClass) {
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
             IMP imp = method_getImplementation(method);
             const char *types = method_getTypeEncoding(method);
             class_addMethod(oriClass, m_sel, imp, types);
         }
     }
    free(mothList_f);
}

void KKHookInstanceMethod(Class claz, Class oriClass) {
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
             Method oriMethod = class_getInstanceMethod(oriClass, NSSelectorFromString(oriMethodName));
             method_exchangeImplementations(method, oriMethod);
         }
     }
    free(mothList_f);
}
//
//void KKHookClassMethod(Class claz, Class oriClass) {
//    NSMutableSet *cls_methods = [[NSMutableSet alloc] init];
//    // 获取元类
//    Class metaClass = objc_getMetaClass(class_getName(claz));
//    // 获取方法列表
//    unsigned int methodCount = 0;
//    Method *methodList = class_copyMethodList(metaClass, &methodCount);
//    NSLog(@"Class methods for %@:", NSStringFromClass(claz));
//    for (unsigned int i = 0; i < methodCount; i++) {
//        Method method = methodList[i];
//        SEL selector = method_getName(method);
//        const char *methodName = sel_getName(selector);
//        NSString *m_name = [NSString stringWithFormat:@"%s", methodName];
//        if([m_name hasPrefix:@"hook"]) {
//            if([cls_methods containsObject:m_name]) {
//                NSLog(@"\n\n\n========= 方法名重复: %@ ========\n\n\n", m_name);
//                raise(9);
//            }
//            [cls_methods addObject:m_name];
//            NSString *oriMethodName = [m_name componentsSeparatedByString:@"_"][1];
//            Method oriMethod = class_getInstanceMethod(metaClass, NSSelectorFromString(oriMethodName));
////            oriMethod = class_getInstanceMethod(oriClass, NSSelectorFromString(oriMethodName));
//            method_exchangeImplementations(method, oriMethod);
//        }
//    }
//    // 释放方法列表
//    free(methodList);
//}

void KKHookClass(Class claz) {
    Class oriClass = claz;
    // Hook不可见类
    if ([NSStringFromClass(claz) containsString:@"InvisibleHook__"]) {
        NSArray *classStrs = [NSStringFromClass(claz) componentsSeparatedByString:@"__"];
        oriClass = NSClassFromString(classStrs[1]);
        KKHookMethodAdd(claz, oriClass);
        KKHookMethodAdd(objc_getMetaClass(object_getClassName(claz)), objc_getMetaClass(object_getClassName(oriClass)));
    }
    KKHookInstanceMethod(oriClass, oriClass);
    KKHookInstanceMethod(objc_getMetaClass(object_getClassName(oriClass)), objc_getMetaClass(object_getClassName(oriClass)));
    
}
