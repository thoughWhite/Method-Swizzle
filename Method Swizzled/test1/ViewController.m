//
//  ViewController.m
//  test1
//
//  Created by white on 16/9/13.
//  Copyright (c) 2016 elephant.com. All rights reserved.
//


#import "ViewController.h"
#import "UIViewController+Load.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"%d",self.isExchange);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end