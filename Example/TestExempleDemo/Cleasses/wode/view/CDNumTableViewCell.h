//
//  CDNumTableViewCell.h
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/8.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//自定义cell

@interface CDNumTableViewCell : UITableViewCell
//类方法
+ (instancetype)numcellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)NSDictionary *items;

@end

NS_ASSUME_NONNULL_END
