//
//  CDProductCollectionViewCell.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/8.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDProductCollectionViewCell.h"

@implementation CDProductCollectionViewCell

- (void)setData:(CDJsonData *)data{
    _data = data;
    _data.title = @"";
    _data.ids = @"";
}
@end
