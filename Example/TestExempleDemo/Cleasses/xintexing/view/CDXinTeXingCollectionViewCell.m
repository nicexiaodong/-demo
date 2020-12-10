//
//  CDXinTeXingCollectionViewCell.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/9.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDXinTeXingCollectionViewCell.h"

@interface CDXinTeXingCollectionViewCell ()
@property (nonatomic, strong)UIImageView *imageView;
@end


@implementation CDXinTeXingCollectionViewCell
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = kScreenSize;
        [self addSubview:_imageView];
    }
    return _imageView;
}
- (void)setImage:(UIImage *)image{
    _image = image;
    //把数据放在控件上
    self.imageView.image = image;
}
@end
