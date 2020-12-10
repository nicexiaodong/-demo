//
//  CDNumTableViewCell.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/8.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDNumTableViewCell.h"

@implementation CDNumTableViewCell

+ (instancetype)numcellWithTableView:(UITableView *)tableView{
    //⚠️cell复用
//    解决办法：根据不同的cell类型，填写不同的id
    static NSString *cellID = @"cellID";
    CDNumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CDNumTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
        
- (void)setItems:(NSDictionary *)items{
    _items = items;
    self.detailTextLabel.textColor = [UIColor redColor];
    
    
}



@end
