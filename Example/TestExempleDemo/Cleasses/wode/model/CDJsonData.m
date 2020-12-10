//
//  CDJsonData.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/8.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDJsonData.h"

@implementation CDJsonData
+(instancetype)productWithDict:(NSDictionary *)dict{
    CDJsonData *p = [[self alloc]init];
    p.title = dict[@"title"];
    p.ids = dict[@"id"];
    return p;
}
@end
