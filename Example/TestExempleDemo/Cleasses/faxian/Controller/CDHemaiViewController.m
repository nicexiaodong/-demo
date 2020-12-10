//
//  CDHemaiViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/3.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDHemaiViewController.h"
#import "CDGroupBtn.h"
#import "UIView+CDFrame.h"
@interface CDHemaiViewController ()
@property (nonatomic, strong)CDGroupBtn *groupBtn;
@property (nonatomic, strong)UIView *blueView;
@end

@implementation CDHemaiViewController
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    self.tabBarController.tabBar.hidden = YES;
//    
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = NO;
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.groupBtn.frame = CGRectMake(0, 0, 100, 44);
    self.navigationItem.titleView = self.groupBtn;
//    [self.navigationController.navigationBar setTranslucent:NO];
    [self blueView];
}
//点击时间
- (void)groupActionClick:(UIButton *)sender{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.blueView.h = self.blueView.h?0:150;
        sender.titleLabel.transform = CGAffineTransformRotate(sender.titleLabel.transform, M_PI);
    }];
    
}
- (CDGroupBtn *)groupBtn{
    if (!_groupBtn) {
        _groupBtn = [[CDGroupBtn alloc]init];
        [_groupBtn setTitle:@"aaaa" forState:UIControlStateNormal];
        [_groupBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _groupBtn.backgroundColor = [UIColor redColor];
        _groupBtn.imageView.backgroundColor = [UIColor blueColor];
        [_groupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_groupBtn addTarget:self action:@selector(groupActionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _groupBtn;
}


- (UIView *)blueView{
    if (!_blueView) {
        _blueView = [[UIView alloc]init];
        _blueView.backgroundColor = [UIColor blueColor];
        _blueView.frame = CGRectMake(0, 64, kScreenSizeWidth, 0);
        [self.view addSubview:_blueView];
    }
    return _blueView;
}

@end
