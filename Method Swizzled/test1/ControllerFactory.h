//
//  ControllerFactory.h
//  test1
//
//  Created by white on 16/9/14.
//  Copyright © 2016年 elephant.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KControllerColor) {
    KColorWhite,
    KColorRed
};
@interface ControllerFactory : NSObject

+ (UIViewController *)controllerByColor:(KControllerColor)color;

@end
