//
//  NSObject+SwizzleMethod.m
//  test1
//
//  Created by white on 16/9/14.
//  Copyright © 2016年 elephant.com. All rights reserved.
//

#import "NSObject+SwizzleMethod.h"

static inline Class className(NSString *className) {
    return NSClassFromString(className);
}

static inline Method methodByClassAndSel(Class class, SEL instanceSel) {
    return class_getInstanceMethod(class,instanceSel);
}

static inline BOOL isAddMethodSuccess(Class class, SEL instanceSel,Method method) {
    return  class_addMethod(class, instanceSel, method_getImplementation(method), method_getTypeEncoding(method));
}

static inline void replaceMethod(Class class,SEL instanceSel,Method method) {
    class_replaceMethod(class, instanceSel, method_getImplementation(method), method_getTypeEncoding(method));
}

static inline void exchangeImplementations(Method originalMethod,Method swizzleMethod) {
    method_exchangeImplementations(originalMethod, swizzleMethod);
}

@implementation NSObject (SwizzleMethod)
+ (void)swizzleSel:(SEL)swizzleSel swizzleClass:(NSString *)swizzleClassName originalSel:(SEL)originalSel originalClass:(NSString *)originalClassName {
    
    NSAssert(swizzleClassName, @"swizzleClassName must be not nil");
    NSAssert(swizzleClassName, @"originalClassName must be not nil");
    
    Class swizzledClass = className(swizzleClassName);
    Class originaClass =  className(originalClassName);
    
    NSAssert([swizzledClass instancesRespondToSelector:swizzleSel], @"swizzledClass can not respond swizzleSel");
    NSAssert([originaClass instancesRespondToSelector:originalSel], @"originaClass can not respond originalSel");
    
    BOOL isSameClass = [swizzleClassName isEqualToString:originalClassName];
    if (isSameClass) {
        [self swizzleSel:swizzleSel originalSel:originalSel sameClass:swizzleClassName];
    } else {
        Method originalMethod = methodByClassAndSel(originaClass, originalSel);
        Method swizzledMethod = methodByClassAndSel(swizzledClass, swizzleSel);
        
        bool isAddMethod = isAddMethodSuccess(originaClass, swizzleSel, swizzledMethod);
        
        swizzledMethod = class_getInstanceMethod(originaClass, swizzleSel);
        if (isAddMethod) {
            replaceMethod(swizzledClass, originalSel, originalMethod);
        } else {
            exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}

+ (void)swizzleSel:(SEL)swizzleSel originalSel:(SEL)originalSel sameClass:(NSString *)sameClass {
    Class swizzledClass = className(sameClass);
    
    Method originalMethod = methodByClassAndSel(swizzledClass, originalSel);
    Method swizzledMethod = methodByClassAndSel(swizzledClass, swizzleSel);
    
    bool isAddMethod = isAddMethodSuccess(swizzledClass, swizzleSel, swizzledMethod);
    if (isAddMethod) {
        replaceMethod(swizzledClass, originalSel, originalMethod);
    } else {
        exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
