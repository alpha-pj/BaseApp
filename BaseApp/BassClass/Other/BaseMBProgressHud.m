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

#pragma mark 显示提示文本1秒(window上)
+ (void)showMBHudWithText:(NSString *)text {
    [BaseMBProgressHud showMBHudWithText:text view:[UIApplication sharedApplication].keyWindow];
}

#pragma mark 显示提示文本1秒(view上)
+ (void)showMBHudWithText:(NSString *)text view:(UIView *)view {
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = text;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.label.numberOfLines = 0;
    hud.margin = 10.f;
    [view addSubview:hud];
    
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1.0f];
}

/***************************/

#pragma mark 显示提示文本1秒并设置位置
+ (void)showMBHudWithText:(NSString *)text position:(PositionType)type {
    [BaseMBProgressHud showMBHudWithText:text view:[UIApplication sharedApplication].keyWindow position:type];
}
#pragma mark 显示提示文本1秒(view上)并设置位置
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
    [hud hideAnimated:YES afterDelay:1.0f];
}

@end
