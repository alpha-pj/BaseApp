//
//  UIButton+CreateButton.m
//  TimeDiary
//
//  Created by PeiJun on 2018/7/9.
//  Copyright © 2018年 brt. All rights reserved.
//

#import "UIButton+CreateButton.h"

@implementation UIButton (CreateButton)

+ (UIButton *)createButtonWithTextColorHexString:(NSString *)hexString title:(NSString *)title font:(UIFont *)font {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.titleLabel.font = font;
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor colorWithHexString:hexString] forState:(UIControlStateNormal)];
    return button;
}

@end
