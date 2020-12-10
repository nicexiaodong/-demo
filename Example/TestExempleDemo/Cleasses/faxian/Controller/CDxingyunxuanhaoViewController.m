//
//  CDxingyunxuanhaoViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/3.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDxingyunxuanhaoViewController.h"

@interface CDxingyunxuanhaoViewController ()
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation CDxingyunxuanhaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"幸运选号";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:self.imageView];
    
    //image闪动画
    self.imageView.animationImages = @[[UIImage imageNamed:@"top"],[UIImage imageNamed:@"logo_40"]];
    self.imageView.animationDuration = 1;
    self.imageView.animationRepeatCount = 0;
    [self.imageView startAnimating];
    
    
    
    
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}


@end
