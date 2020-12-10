//
//  CDXinTeXingCollectionViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/9.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDXinTeXingCollectionViewController.h"
#import "CDXinTeXingCollectionViewCell.h"
#define CDXinTeXingCollectionViewCellID @"CDXinTeXingCollectionViewCellID"
#import "CDTabBarViewController.h"
@interface CDXinTeXingCollectionViewController ()
@property (nonatomic, assign)CGFloat pagex;
@end

@implementation CDXinTeXingCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = kScreenSize.size;//item大小
    layout.minimumLineSpacing = 0;//item上下之间的距离
//    layout.minimumInteritemSpacing = 0;//item 左右最小的距离
//    layout.sectionInset = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)//组的内边距
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.pagingEnabled = YES;//分页
    self.collectionView.showsHorizontalScrollIndicator = NO;//隐藏滚动条
    self.collectionView.bounces = NO;//取消弹性效果
    [self.collectionView registerClass:[CDXinTeXingCollectionViewCell class] forCellWithReuseIdentifier:CDXinTeXingCollectionViewCellID];
    
    //添加按钮
    UIButton *enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [enterBtn setBackgroundColor:[UIColor redColor]];
    enterBtn.frame = CGRectMake(3*kScreenSizeWidth +50, kScreenSizeHeight-100, kScreenSizeWidth-100, 50);
    [enterBtn addTarget:self action:@selector(enterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.collectionView addSubview:enterBtn];
}
//监听
- (void)enterBtn:(UIButton *)sender{
    
    //切换window控制器
    CDTabBarViewController *tab = [[CDTabBarViewController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = tab;
    
    
}

//监听collectionView滑动完成

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    
    //获取偏移量 x
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //判断滑动方向
    if (self.pagex > offsetX) {
        //从左往右
        NSLog(@"从左往右");
    }else{
        //从右往左
        NSLog(@"从右往左");
    }
    
    //设置介绍图片
    
    //添加动画
    [UIView animateWithDuration:0.25 animations:^{
       
        
    }];
    
    self.pagex = offsetX;
    
    
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CDXinTeXingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CDXinTeXingCollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    cell.image = [UIImage imageNamed:@"top"];
    return cell;
    
}
@end
