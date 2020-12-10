//
//  CDWKViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/10.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDWKViewController.h"
#import <WebKit/WKWebView.h>
@interface CDWKViewController ()

@end

@implementation CDWKViewController

- (void)loadView{
    self.view = [[WKWebView alloc]initWithFrame:kScreenSize];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WKWebView *webView = (WKWebView *)self.view;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [webView loadRequest:urlRequest];
    
}


@end
