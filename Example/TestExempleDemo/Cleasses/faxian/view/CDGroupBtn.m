//
//  CDGroupBtn.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/3.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDGroupBtn.h"
#import "UIView+CDFrame.h"//分类
@implementation CDGroupBtn

- (void)layoutSubviews{
    [super layoutSubviews];
    //自定义btn
//    CGRect labelRect = self.titleLabel.frame;
//
//    labelRect.origin.x = 0;
//
//    self.titleLabel.frame = labelRect;
//
//
//    CGRect imageRect = self.imageView.frame;
//
//    imageRect.origin.x = labelRect.size.width;
//
//    self.imageView.frame = imageRect;
//
    
    self.titleLabel.x = 0;
    
    
    self.imageView.x = self.titleLabel.w;
    
    
    
    
}

@end
