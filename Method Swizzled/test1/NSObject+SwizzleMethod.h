//
//  NSObject+SwizzleMethod.h
//  test1
//
//  Created by white on 16/9/14.
//  Copyright © 2016年 elephant.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (SwizzleMethod)
+ (void)swizzleSel:(SEL)swizzleSel swizzleClass:(NSString *)swizzleClass originalSel:(SEL)originalSel originalClass:(NSString *)originalClass;
@end
