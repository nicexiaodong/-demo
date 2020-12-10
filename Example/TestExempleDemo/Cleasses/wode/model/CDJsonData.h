//
//  CDJsonData.h
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/8.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//字典转模型
@interface CDJsonData : NSObject
+(instancetype)productWithDict:(NSDictionary *)dict;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *ids;
@end

NS_ASSUME_NONNULL_END
