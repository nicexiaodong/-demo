//
//  CDTabBarViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/1.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDTabBarViewController.h"
#import "CDDatingViewController.h"
#import "CDjingjicangViewController.h"
#import "CDxinxiViewController.h"
#import "CDzhukuangjiaViewController.h"
#import "CDdaxianViewController.h"
#import "CDwodeViewController.h"
#import "CDTabbarView.h"
#import "CDNavViewController.h"
@interface CDTabBarViewController ()

@end

@implementation CDTabBarViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //先添加tabbar，在添加navigation
    
    CDDatingViewController *dating = [[CDDatingViewController alloc]init];
    CDdaxianViewController *faxian = [[CDdaxianViewController alloc]init];
    CDxinxiViewController *xinxi = [[CDxinxiViewController alloc]init];
    CDjingjicangViewController *jingjicang = [[CDjingjicangViewController alloc]init];
    CDwodeViewController *wode = [[CDwodeViewController alloc]init];
    
    
    CDNavViewController *datingNavVC = [[CDNavViewController alloc]initWithRootViewController:dating];
    CDNavViewController *faxianNavVC = [[CDNavViewController alloc]initWithRootViewController:faxian];
    CDNavViewController *xinxiNavVC = [[CDNavViewController alloc]initWithRootViewController:xinxi];
    CDNavViewController *jingjicangNavVC = [[CDNavViewController alloc]initWithRootViewController:jingjicang];
    CDNavViewController *wodeNavVC = [[CDNavViewController alloc]initWithRootViewController:wode];
    
    
    self.viewControllers = @[datingNavVC,faxianNavVC,xinxiNavVC,jingjicangNavVC,wodeNavVC];
    
    //自定义tabbar
    
    CDTabbarView *tabbar = [[CDTabbarView  alloc]init];
    
    tabbar.backgroundColor = [UIColor redColor];
    
//    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.tabBar.frame));
//    CGFloat x = self.tabBar.frame.origin.x;
//    CGFloat y = self.tabBar.frame.origin.y;
//    CGFloat w = self.tabBar.frame.size.width;
//    CGFloat h = self.tabBar.frame.size.height;
//    if (kDevice_Is_iPhoneX) {
//        tabbar.frame = CGRectMake(x, y-34, w, h);
//    }else{
//        tabbar.frame = CGRectMake(x, y, w, h);
//    }
    tabbar.frame = self.tabBar.bounds;
    
    
    
    //block 使用
    __weak typeof(self) weakSelf = self;
    tabbar.tabbarBtnBlock = ^(NSInteger index) {
        weakSelf.selectedIndex = index;
    };
    // 设置button
    for (int i = 0; i<self.viewControllers.count; i++) {
        [tabbar addBtnWithColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] andselectedColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]];
    } 
    [self.tabBar addSubview:tabbar];
    
}

@end
