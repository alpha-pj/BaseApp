//
//  BaseMBProgressHud.h
//  BaseApp
//
//  Created by PeiJun on 2018/4/23.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

typedef NS_ENUM(NSUInteger, PositionType) {
    PositionTypeTop,
    PositionTypeCenter,
    PositionTypeBottom,
};

@interface BaseMBProgressHud : MBProgressHUD


/**
 显示提示文本1秒(window上)

 @param text 提示文本
 */
+ (void)showMBHudWithText:(NSString *)text;

/**
  显示提示文本1秒(view上)

 @param text 提示文本
 @param view 文本的父视图
 */
+ (void)showMBHudWithText:(NSString *)text view:(UIView *)view;


/**
 显示提示文本1秒并设置位置

 @param text 提示文本
 @param type 位置
 */
+ (void)showMBHudWithText:(NSString *)text position:(PositionType)type;

/**
 显示提示文本1秒(view上)并设置位置

 @param text 提示文本
 @param view 文本的父视图
 @param type 位置
 */
+ (void)showMBHudWithText:(NSString *)text view:(UIView *)view position:(PositionType)type;

@end
