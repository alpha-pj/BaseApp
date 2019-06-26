//
//  AppMacro.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

/*************App*************/
#define FontName_Normal @"PingFang-SC-Regular"  //苹方体
#define FontName_Bold @"PingFang-SC-Medium"  //苹方体-中

// 字体大小(常规/粗体)
#define AppFontNormal(fontSize) [UIFont fontWithName:FontName_Normal size:round(fontSize)]
#define AppFontBold(fontSize) [UIFont fontWithName:FontName_Bold size:round(fontSize)]

#define AppID @""
#define APPName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]  //app名称
#define APPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] //版本号
#define APPBundleID [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"] //BundleID

/***********常用方法***********/
#define ColorHexString(hexString) [UIColor colorWithHexString:hexString]

// 屏幕尺寸
#define ScreenWidth ((([UIScreen mainScreen].bounds.size.width)>([UIScreen mainScreen].bounds.size.height))?([UIScreen mainScreen].bounds.size.height):([UIScreen mainScreen].bounds.size.width))
#define ScreenHeight ((([UIScreen mainScreen].bounds.size.width)>([UIScreen mainScreen].bounds.size.height))?([UIScreen mainScreen].bounds.size.width):([UIScreen mainScreen].bounds.size.height))
#define kHeightRate (ScreenHeight / 667.0)    // 高比
#define KWidthRate (ScreenWidth / 375.0)        // 宽比
//宽比高比较小的一个
#define kMinRate (kHeightRate > KWidthRate ? KWidthRate : kHeightRate)
//宽比高比较大的一个
#define kMaxRate (kHeightRate < KWidthRate ? KWidthRate : kHeightRate)

// 自定义通知格式
#define BasePostNotif(Name,Object) [[NSNotificationCenter defaultCenter] postNotificationName:Name object:Object]
#define BaseAddNotif(Observe,Method,Name,Object) [[NSNotificationCenter defaultCenter] addObserver:Observe selector:Method name:Name object:Object]
#define BaseRemoveNotif(Observe,Name,Object) [[NSNotificationCenter defaultCenter] removeObserver:Observe name:Name object:Object]

// 自定义打印
#ifdef  DEBUG
#define PoLog(...) NSLog(__VA_ARGS__);
#define Log_METHOD NSLog(@"%s",__func__);
#else
#define PoLog(...);
#define Log_METHOD;
#endif

#define weakify(var)   __weak typeof(var) weakSelf = var
#define strongify(var) __strong typeof(var) strongSelf = var

//运行时间
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   PoLog(@"Time: %f", -[startTime timeIntervalSinceNow])

/** 判断是否是FullScreen（全面屏）*/
//安全区域
#define SafeAreaInsets [NSString safeAreaInsets]
#define FullScreen [NSString isFullScreen]
// 状态栏高度
#define STATUS_BAR_HEIGHT (FullScreen ? SafeAreaInsets.top : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (FullScreen ? (STATUS_BAR_HEIGHT + 44.f) : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (FullScreen ? (49.f + SafeAreaInsets.bottom) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (FullScreen ? SafeAreaInsets.bottom : 0.f)

// 是否iPad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#endif /* AppMacro_h */
