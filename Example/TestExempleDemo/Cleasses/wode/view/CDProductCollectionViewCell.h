//
//  CDProductCollectionViewCell.h
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/8.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDJsonData.h"
NS_ASSUME_NONNULL_BEGIN

@interface CDProductCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)CDJsonData *data;

@end

NS_ASSUME_NONNULL_END
