//
//  CDNumViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/7.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDNumViewController.h"
#import "CDJsonData.h"
#import "CDProductCollectionViewCell.h"
#define CDProductCollectionViewCellID @"CDProductCollectionViewCellID"
@interface CDNumViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation CDNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    //collectionview
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //item大小
    layout.itemSize = CGSizeMake(80, 100);
    //item左右最小距离
    layout.minimumInteritemSpacing = 0;
    //组内边距
    layout.sectionInset = UIEdgeInsetsMake(16, 0, 0, 0);
    
    
    
    
    self.collectionView  = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate =self;
    self.collectionView.dataSource = self;
//    self.collectionView.backgroundColor
    
    //注册单元格
    [self.collectionView registerClass:[CDProductCollectionViewCell class] forCellWithReuseIdentifier:CDProductCollectionViewCellID];
    [self.view addSubview:self.collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CDProductCollectionViewCellID forIndexPath:indexPath];
    cell.data = self.dataArr[indexPath.row];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}




- (NSArray *)dataArr{
    if (!_dataArr) {
        //解析json文件数据
        NSString *path = [[NSBundle mainBundle]pathForResource:@"" ofType:@"json"];//路经
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *tempArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *arr = [NSMutableArray array];
        
        for (NSDictionary *dic in tempArr) {
            CDJsonData *p = [CDJsonData productWithDict:dic];
            [arr addObject:p];
        }
        
        _dataArr = arr;
    }
    return _dataArr;
}



@end
