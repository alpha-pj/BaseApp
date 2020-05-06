//
//  AppDelegate+Method.m
//  Lovers
//
//  Created by PeiJun on 2019/6/12.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "AppDelegate+Method.h"

//#import "BaseTabBarController.h"
#import "BaseCYLTabBarController.h"

#import "BaseCYLPlusButton.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate (Method)

//初始化配置
- (void)initialAppConfiguration {
    if (@available(iOS 11.0, *)) {
        //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
        [UITableView appearance].estimatedRowHeight = 0;
        [UITableView appearance].estimatedSectionHeaderHeight = 0;
        [UITableView appearance].estimatedSectionFooterHeight = 0;
    }
    //网络监听
    [BaseNetWork aFNetworkStatus];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *localRefer = [user objectForKey:ImageReferer];
    //图片加载Referer设置
    NSString *refertext = DefaultReferer;   //默认的referer
    if ([NSString isString:localRefer]) {
        refertext = localRefer;
    }
    [user setObject:refertext forKey:ImageReferer];
    //SDWebImage配置
    [[SDWebImageDownloader sharedDownloader] setValue:refertext forHTTPHeaderField:@"Referer"];
    [SDImageCache sharedImageCache].config.maxMemoryCost = 100 * 1024 * 1024;
    [SDImageCache sharedImageCache].config.maxDiskSize = 150 * 1024 * 1024;
    //SDWebImage支持webp
    [[SDImageCodersManager sharedManager] addCoder:[SDImageWebPCoder sharedCoder]];
//    //YYImage配置
//    [YYWebImageManager sharedManager].headers = @{@"Referer": refertext};
//    //缓存限制100M
//    [YYImageCache sharedCache].diskCache.costLimit = 100 * 1024 * 1024;
//    //对YYCache进行配置，避免OOM 限制ram
//    [YYImageCache sharedCache].memoryCache.costLimit = 100 * 1024 * 1024;
    
    //IQKeyboardManager设置
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.shouldResignOnTouchOutside = YES; //控制点击背景是否收起键盘
    keyboardManager.placeholderFont = AppFontNormal(12);
    keyboardManager.toolbarDoneBarButtonItemText = AppText_complete;
    keyboardManager.shouldShowToolbarPlaceholder = NO;
    keyboardManager.toolbarTintColor = ColorHexString(@"FF76A6");
    //MBProgressHUD配置
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = ColorHexString(@"#FFD272");
    [BaseMBProgressHud appearance].animationType = MBProgressHUDAnimationZoom;
    //全局光标颜色
    [UITextField appearance].tintColor = [UIColor colorWithHexString:@"#FF76A6"];
    [UITextView appearance].tintColor = [UIColor colorWithHexString:@"#FF76A6"];
}

//设置window的rootController
- (void)setRootViewController {
//    [BaseCYLPlusButton registerPlusButton];
//    BaseTabBarController *tabBarController = [[BaseTabBarController alloc] init];
    BaseCYLTabBarController *tabBarController = [[BaseCYLTabBarController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    tabBarController.delegate = self;
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

#pragma mark UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    if ([control isKindOfClass:[BaseCYLPlusButton class]]) {
        //中间加号(跳转去BaseCYLPlusButton.m设置)
    } else if ([control isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        //(跳转去BaseTabBarController.m设置)
//        [self addScaleAnimationOnView:control repeatCount:1];
    }
}

////缩放动画
//- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
//    //需要实现的帧动画，这里根据需求自定义
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"transform.scale";
//    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
//    animation.duration = 1;
//    animation.repeatCount = repeatCount;
//    animation.calculationMode = kCAAnimationCubic;
//    [animationView.layer addAnimation:animation forKey:nil];
//}


@end
