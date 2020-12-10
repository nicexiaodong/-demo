//
//  CDjingjicangViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/1.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDjingjicangViewController.h"

@interface CDjingjicangViewController ()

@end

@implementation CDjingjicangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"竞技场";
    //设置控制器背景图片
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@""].CGImage;
     
    //设置导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    //给View添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)tap{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
