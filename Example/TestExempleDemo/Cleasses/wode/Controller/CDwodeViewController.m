//
//  CDwodeViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/1.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDwodeViewController.h"
#import "CDShezhiViewController.h"
#import <WebKit/WebKit.h>
@interface CDwodeViewController ()
@property (nonatomic, strong)UIButton *button;
@end

@implementation CDwodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    self.button.frame = CGRectMake(0, 0, 50, 44);
//    [self.view addSubview:self.button];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:self.button];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //
    UIImage *image = [UIImage imageNamed:@""];
    //图片中间1像素进行拉伸
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
    
    
    
}

- (void)test1{
    WKWebView *web = [[WKWebView alloc]initWithFrame:kScreenSize];
    //本地文件，创建成URL打开
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"文件名" withExtension:nil];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:req];
}


- (void)buttonActionClick:(UIButton *)sender{
    CDShezhiViewController *vc = [[CDShezhiViewController alloc]init];
    vc.plistName = @"shezhiList";
    [self.navigationController pushViewController:vc animated:YES];
}


- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"登陆" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonActionClick:) forControlEvents:UIControlEventTouchUpInside];
        [_button setBackgroundColor:[UIColor redColor]];
    }
    return _button;
}

@end
