//
//  CDdaxianViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/1.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDdaxianViewController.h"
#import "CDHemaiViewController.h"
#import "CDxingyunxuanhaoViewController.h"
@interface CDdaxianViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation CDdaxianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"发现";
    
    self.tableView.frame = CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeHeight);
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"tableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"11111";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        CDHemaiViewController *vc = [[CDHemaiViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        CDxingyunxuanhaoViewController *vc = [[CDxingyunxuanhaoViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
    
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
