//
//  ControllerFactory.m
//  test1
//
//  Created by white on 16/9/14.
//  Copyright © 2016年 elephant.com. All rights reserved.
//

#import "ControllerFactory.h"
#import "WhiteViewController.h"
#import "ViewController.h"
#import "UIViewController+Load.h"
@implementation ControllerFactory
+ (UIViewController *)controllerByColor:(KControllerColor)color {
    UIViewController *controller = nil;
    switch (color) {
        case KColorWhite:
            controller = [WhiteViewController new];
            controller.exchange = NO;
            break;
        case KColorRed:
            controller =  [ViewController new];
            controller.exchange = YES;
            break;
    }
    return controller;
}

@end
