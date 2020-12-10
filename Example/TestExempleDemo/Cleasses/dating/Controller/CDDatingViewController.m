//
//  CDDatingViewController.m
//  TestExempleDemo
//
//  Created by chen dong on 2020/12/1.
//

#import "CDDatingViewController.h"

@interface CDDatingViewController ()
@property (nonatomic, strong)UIView *coverView;
@end

@implementation CDDatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"大厅";
    
    UIImage *image = [UIImage imageNamed:@""];
    //告诉系统 图片不需要渲染
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(itemActionClick)];
    item.title = @"活动";
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)itemActionClick{
    //添加动画 遮照
    [UIView animateWithDuration:0.25 animations:^{
        UIView *coverView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        coverView.backgroundColor = [UIColor grayColor];
        coverView.alpha = 0.5;
        [self.tabBarController.view addSubview:coverView];
        self.coverView = coverView;
    }];
    
    //给View添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.coverView addGestureRecognizer:tap];

}

- (void)tap{
    
    [self.coverView removeFromSuperview];
    
    
}


@end
