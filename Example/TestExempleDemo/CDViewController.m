//
//  CDViewController.m
//  TestExempleDemo
//
//  Created by 3397838812@qq.com on 12/01/2020.
//  Copyright (c) 2020 3397838812@qq.com. All rights reserved.
//

#import "CDViewController.h"
#import <SystemServices/SystemServices.h>
@interface CDViewController ()

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //获取硬件信息
    SystemServices *sys = [SystemServices sharedServices];
    
    NSLog(@"%@",[sys.allSystemInformation description]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
