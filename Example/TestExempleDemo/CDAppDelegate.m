//
//  CDAppDelegate.m
//  TestExempleDemo
//
//  Created by 3397838812@qq.com on 12/01/2020.
//  Copyright (c) 2020 3397838812@qq.com. All rights reserved.
//

#import "CDAppDelegate.h"
#import "CDTabBarViewController.h"
#import "CDNavViewController.h"
#import "CDXinTeXingCollectionViewController.h"
@implementation CDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //创建windows
    self.window = [[UIWindow alloc]initWithFrame:kScreenSize];

    //创建tabbar


    self.window.rootViewController = [self pickViewController];

//    windows 显示
    [self.window makeKeyAndVisible];



    //先把当前版本号保存到沙盒
    [self saveAppVersion];
    
    
    
    return YES;
}

//新特性页面
- (UIViewController *)pickViewController{
    
    //    1、新特性页面
        
    //判断沙盒版本是不是和当前版本一致
    if ([[self loadSaveAppVersion] isEqualToString:[self loadAppVersion]]) {
        //一致不显示新特性，显示tabbar
        return [[CDTabBarViewController alloc]init];
    }else{
        //不一致显示新特性页面
        
        return [[CDXinTeXingCollectionViewController alloc]init];
    }
    
}

//获取沙盒中的版本号

- (NSString *)loadSaveAppVersion{
    
    //获取ud单利
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    
    return [info objectForKey:@"appVersion"];
}

//获取当前info到版本号

- (NSString *)loadAppVersion{
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    NSString *appVersion = info[@"CFBundleVersion"];
    return appVersion;
}



//把当前版本号保存到沙盒

- (void)saveAppVersion{
    //获取info字典
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSLog(@"%@",infoDic[@"CFBundleVersion"]);
    NSString *appVersion = infoDic[@"CFBundleVersion"];
    
    //获取当前版本号
    
    //保存到沙盒
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    
    [info setObject:appVersion forKey:@"appVersion"];
    
}





















- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}













@end
