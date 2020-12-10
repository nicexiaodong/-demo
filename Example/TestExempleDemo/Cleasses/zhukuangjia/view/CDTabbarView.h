//
//  CDTabbarView.h
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/2.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDTabbarView : UIView
//block 回调
@property (nonatomic, copy)void(^tabbarBtnBlock)(NSInteger);

- (void)addBtnWithColor:(UIColor *)color andselectedColor:(UIColor *)selColor;


@end

NS_ASSUME_NONNULL_END
