//
//  AppDelegate.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/20.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "AppDelegate.h"
//#import "BaseTabBarController.h"
#import "BaseCYLTabBarController.h"

#import "SDImageCodersManager.h"
#import "SDImageWebPCoder.h"

#import "BaseCYLPlusButton.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化配置
    [self initializationConfiguration];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark 初始化配置
- (void)initializationConfiguration {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [BaseCYLPlusButton registerPlusButton];
//    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    BaseCYLTabBarController *tabBarController = [[BaseCYLTabBarController alloc] init];
    tabBarController.delegate = self;
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    if (@available(iOS 11.0, *)) {
        //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    }
    //解决ios12webView全屏播放视频返回后状态栏消失
    [self videoPlayerFinishedToShowStatusBar];
    //网络监听
    [BaseNetWork aFNetworkStatus];
    
    //SDWebImage支持webp
    [[SDImageCodersManager sharedManager] addCoder:[SDImageWebPCoder sharedCoder]];
}

#pragma mark UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    if ([control isKindOfClass:[BaseCYLPlusButton class]]) {
        //中间加号(跳转去BaseCYLPlusButton.m设置)
    } else if ([control isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        //(跳转去BaseTabBarController.m设置)
        [self addScaleAnimationOnView:control repeatCount:1];
    }
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//解决ios12webView全屏播放视频返回后状态栏消失
- (void)videoPlayerFinishedToShowStatusBar {
    if (@available(iOS 12.0, *)) {
        [[NSNotificationCenter defaultCenter] addObserverForName:UIWindowDidBecomeKeyNotification object:self.window queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
        }];
    }
}

@end
