//
//  UIViewController+Load.m
//  test1
//
//  Created by white on 16/9/14.
//  Copyright © 2016年 elephant.com. All rights reserved.
//

#import "UIViewController+Load.h"
#import "NSObject+SwizzleMethod.h"

const NSString *exchangeKey = @"exchangeKey";
@implementation UIViewController (Load)
+ (void)load {
    NSString *className = NSStringFromClass([self class]);
    SEL originalSel = @selector(viewWillAppear:);
    SEL swizzledSel = @selector(xxd_viewWillAppear:);
    [self swizzleSel:swizzledSel swizzleClass:className originalSel:originalSel originalClass:className];
}

- (void)setExchange:(BOOL)exchange {
    objc_setAssociatedObject(self, (__bridge const void *)(exchangeKey), exchange?@1:@0, OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isExchange {
    return objc_getAssociatedObject(self, (__bridge const void *)(exchangeKey));
}

- (void)xxd_viewWillAppear:(BOOL)animated {
    [self xxd_viewWillAppear:animated];
    self.view.backgroundColor = [UIColor yellowColor];
}
@end
