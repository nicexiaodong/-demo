//
//  CDShezhiViewController.m
//  TestExempleDemo_Example
//
//  Created by chen dong on 2020/12/4.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDShezhiViewController.h"
#import "CDNumViewController.h"
#import "UIView+CDFrame.h"
#import "CDWKViewController.h"
#import "CDNavViewController.h"
#import <MessageUI/MessageUI.h>
@interface CDShezhiViewController ()<UITableViewDelegate,UITableViewDataSource,MFMessageComposeViewControllerDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *groupArr;
@property (nonatomic, strong)UIDatePicker *datePicker;
@property (nonatomic, strong)NSDictionary *itemDic;
@end

@implementation CDShezhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    self.navigationItem.rightBarButtonItem = item;
    
    NSLog(@"%@",self.groupArr);
    
    self.tableView.frame = CGRectMake(0, 0, kScreenSizeWidth, kScreenSizeHeight);
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *group = self.groupArr[section];
    NSArray *items = group[@"items"];
    return items.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary * group = self.groupArr[section];
    return group[@"header"];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSDictionary * group = self.groupArr[section];
    return group[@"footer"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary * group = self.groupArr[indexPath.section];
    
    NSArray *items = group[@"items"];
    
    NSDictionary *item = items[indexPath.row];
    self.itemDic = item;
    static NSString *cellid = @"setting_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.imageView.image =[UIImage imageNamed:item[@"image"]];
    cell.textLabel.text = item[@"title"];
    UISwitch *obj = [[UISwitch alloc]init];
    cell.accessoryView = obj;//添加控件
    //添加监听
    [obj addTarget:self action:@selector(SwitchChange:) forControlEvents:UIControlEventValueChanged];
    
    //读取NSUserDefaults数据
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    obj.on=[ud boolForKey:self.itemDic[@"SwitchChange"]];
    
    return cell;
}
//开关状态改变
- (void)SwitchChange:(UISwitch *)sender{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:sender.isOn forKey:self.itemDic[@"SwitchChange"]];
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * group = self.groupArr[indexPath.section];
    
    NSArray *items = group[@"items"];
    
    NSDictionary *item = items[indexPath.row];
    
    if (item[@"targetVC"] &&[item[@"targetVC"] length]>0) {
        NSString *targetVC = item[@"targetVC"];
        Class clz =NSClassFromString(targetVC);
        UIViewController *vc = [[clz alloc]init];
        vc.title = item[@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.section==0&&indexPath.row ==1) {
        //创建文本框
        UITextField *textField = [[UITextField alloc]init];
        
        //获取cell
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        //添加到cell上
        [cell.contentView addSubview:textField];
        //设置第一响应
        
        //创建picker
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        datePicker.datePickerMode =  UIDatePickerModeTime;
        
        textField.inputView = datePicker;
        
        UIToolbar *bar = [[UIToolbar alloc]init];
        bar.h = 44;
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
        UIBarButtonItem *itemFixe = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *sureItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(sureClick)];
        bar.items = @[cancelItem,itemFixe,sureItem];
        textField.inputAccessoryView = bar;
        self.datePicker = datePicker;
    
        [textField becomeFirstResponder];
    }else if(indexPath.section==0&&indexPath.row ==2){
        //字符串转化成方法
        SEL funcName = NSSelectorFromString(@"checkUpDate");
        //从plist文件中获取方法
        
        //忽略警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        //执行方法
        [self performSelector:funcName];
#pragma clang diagnostic pop
    }else if(indexPath.section==0&&indexPath.row ==3){
        
        CDWKViewController *wkWeb = [[CDWKViewController alloc]init];
        CDNavViewController *nav = [[CDNavViewController alloc]initWithRootViewController:wkWeb];
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain  target:self action:@selector(cancelBarClick)];
        
        //controller的navitem
        wkWeb.navigationItem.leftBarButtonItem = item;
        
        
        [self presentViewController:nav animated:YES completion:nil];
    }else if(indexPath.section==1){
        [self makeCall];
    }else{
//        [self makesenfSMS];
//        [self makeAppStor];
        [self makeApp];
    }
}


//跳转到应用程序
- (void)makeApp{
    //
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:[NSURL URLWithString:@"%@://%@"]]) {
        //yes  本地有这个应用程序，打开
        
    }else{
        //no 本地没有这个应用程序，跳转到appstore到应用下载页
        [self makeAppStor];
    }
    
}


//跳转商店
- (void)makeAppStor{
    //获取app
    UIApplication *app = [UIApplication sharedApplication];
    //协议头
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/id1381345664?mt=8"];
    [app openURL:url];
}


//打电话
- (void)makeCall{
    //获取app
    UIApplication *app = [UIApplication sharedApplication];
    //协议头
    NSURL *url = [NSURL URLWithString:@"tel://10010"];
    [app openURL:url];
}

//发短信
- (void)makesenfSMS{
    //获取app
    UIApplication *app = [UIApplication sharedApplication];
    //协议头
    NSURL *url = [NSURL URLWithString:@"sms://10010"];
    [app openURL:url];
    
//    MFMessageComposeViewController *mes = [[MFMessageComposeViewController alloc]init];
//    mes.messageComposeDelegate = self;
//    mes.body = @"test";
//    mes.navigationBar.tintColor = [UIColor blackColor];
//    mes.recipients = [NSArray arrayWithObject:@"10010"];
//    [self presentViewController:mes animated:YES completion:nil];
    
    
}

#pragma mark -MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    
//    NSLog(@"%@",result);
}




//取消按钮
- (void)cancelBarClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//检查新版本
- (void)checkUpDate{
    NSLog(@"111111111");
    
}


- (void)cancelClick{
    
    [self.view endEditing:YES];
    
}

- (void)sureClick{
    
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm";
    NSString *dateStr = [formatter stringFromDate:date];
    NSLog(@"%@",dateStr);
    
    //获取cell
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    cell.detailTextLabel.text = dateStr;
    
    
    [self.view endEditing:YES];

}



- (void)backClick{
     
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)groupArr{
    if (!_groupArr) {
        //解析plist文件数据
        NSString *path = [[NSBundle mainBundle]pathForResource:self.plistName ofType:@"plist"];
        _groupArr = [NSArray arrayWithContentsOfFile:path];
    }
    return _groupArr;
}
@end
