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
#define AppID @""
#define APPName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]  //app名称
#define APPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] //版本号

/***********常用方法***********/
#define ColorHexString(hexString) [UIColor colorWithHexString:hexString]

//图片referer
#define ImgReferer @"image_referer"

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
#define Log(...) NSLog(__VA_ARGS__);
#define Log_METHOD NSLog(@"%s",__func__);
#else
#define Log(...);
#define Log_METHOD;
#endif

#define weakify(var)   __weak typeof(var) weakSelf = var
#define strongify(var) __strong typeof(var) strongSelf = var

//运行时间
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   Log(@"Time: %f", -[startTime timeIntervalSinceNow])

// 判断是否是iPhone X
#define iPhoneX [NSString isiPhoneX]
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

#endif /* AppMacro_h */
