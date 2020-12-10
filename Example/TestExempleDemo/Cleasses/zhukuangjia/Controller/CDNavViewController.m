//
//  CDNavViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/2.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDNavViewController.h"

@interface CDNavViewController ()

@end

@implementation CDNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //不能直接设置navbar的背景色，最上面有一层遮照
//    self.navigationBar.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    //可以直接设置navbar的背景色
    self.navigationBar.barTintColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    [self.navigationBar setTintColor:[UIColor whiteColor]];
 
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}


//重写init方法
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    rootViewController.hidesBottomBarWhenPushed = NO;
    return self;
}

@end
