//
//  CDTabbarView.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/2.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDTabbarView.h"
@interface CDTabbarBtn : UIButton

@end

@implementation CDTabbarBtn

- (void)setHighlighted:(BOOL)highlighted{
//    [super setHighlighted:highlighted];
    
}
@end

@interface CDTabbarView ()
@property (nonatomic, strong)CDTabbarBtn *selectBtn;

@end

@implementation CDTabbarView

- (void)addBtnWithColor:(UIColor *)color andselectedColor:(UIColor *)selColor{
    
    CDTabbarBtn * tabbarBtn = [[CDTabbarBtn alloc]init];
    tabbarBtn.backgroundColor = color ;
    //监听
    [tabbarBtn addTarget:self action:@selector(tabbarBtnActionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:tabbarBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i = 0; i<self.subviews.count; i++) {
        CDTabbarBtn *tabbarBtn = self.subviews[i];
        CGFloat w = kScreenSizeWidth/5.0;
        CGFloat y = 0;
        CGFloat x = i*w;
        CGFloat h = 49;
        tabbarBtn.tag  = i;
        tabbarBtn.frame = CGRectMake(x, y, w, h);
        
        //点击第一个按钮
        if ( i== 0) {
            [self tabbarBtnActionClick:tabbarBtn];
        }
    }
}
//点击tabbarbtn时调用
- (void)tabbarBtnActionClick:(CDTabbarBtn *)sender{

    self.selectBtn.selected = NO;
    sender.selected = YES;
    sender.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    //记录选中的按钮
    self.selectBtn = sender;
    
    
    //切换控制器
//    self.selectedIndex = sender.tag;
    
    
    
    // 判断block回调响应
    if (self.tabbarBtnBlock) {
        //执行
        self.tabbarBtnBlock(sender.tag);
    }
    
}

@end
