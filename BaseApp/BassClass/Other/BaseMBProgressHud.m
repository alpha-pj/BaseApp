//
//  BaseMBProgressHud.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/23.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "BaseMBProgressHud.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation BaseMBProgressHud

#pragma mark 显示提示文本n秒(window上)
+ (void)showMBHudWithText:(NSString *)text {
    [BaseMBProgressHud showMBHudWithText:text view:nil];
}

#pragma mark 显示提示文本n秒(view上)
+ (void)showMBHudWithText:(NSString *)text view:(UIView *)view {
    if ([NSString isBlankString:text]) {
        return;
    }
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = text;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.label.numberOfLines = 0;
    hud.margin *= 0.5;
    [view addSubview:hud];
    
    [hud showAnimated:YES];
    
    CGFloat delay = 1.0f;
    if (text.length > 20) {
        delay = 3.0f;
    } else if (text.length > 10) {
        delay = 2.0f;
    }
    [hud hideAnimated:YES afterDelay:delay];
}

/***************************/

#pragma mark 显示提示文本1秒并设置位置
+ (void)showMBHudWithText:(NSString *)text position:(PositionType)type {
    [BaseMBProgressHud showMBHudWithText:text view:nil position:type];
}
#pragma mark 显示提示文本1秒,并设置view、位置
+ (void)showMBHudWithText:(NSString *)text view:(UIView *)view position:(PositionType)type {
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = text;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.label.numberOfLines = 0;
    hud.margin *= 0.5;
    CGFloat offsetY = CGRectGetHeight(view.frame) / 3.0f;
    switch (type) {
        case PositionTypeTop:
        {
            hud.offset = CGPointMake(hud.offset.x, - offsetY);
        }
            break;
        case PositionTypeCenter:
        {
        }
            break;
        case PositionTypeBottom:
        {
            hud.offset = CGPointMake(hud.offset.x, offsetY);
        }
            break;
            
        default:
            break;
    }
    [view addSubview:hud];
    
    [hud showAnimated:YES];
    
    CGFloat delay = 1.0f;
    if (text.length > 20) {
        delay = 3.0f;
    } else if (text.length > 10) {
        delay = 2.0f;
    }
    [hud hideAnimated:YES afterDelay:delay];
}

/*****************/

#pragma mark 显示加载中
+ (void)showMBHudWithView:(UIView *)view {
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.animationType = MBProgressHUDAnimationZoom;
    [view addSubview:hud];
    [hud showAnimated:YES];
}

#pragma mark 隐藏加载中
+ (void)hideMBHudWithView:(UIView *)view {
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (hud != nil) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES];
    }
}

@end
