//
//  UIButton+CreateButton.m
//  TimeDiary
//
//  Created by PeiJun on 2018/7/9.
//  Copyright © 2018年 brt. All rights reserved.
//

#import "UIButton+CreateButton.h"

@implementation UIButton (CreateButton)

+ (UIButton *)createButtonWithTextColorHexString:(NSString *)hexString title:(NSString *)title fontSize:(CGFloat)fontSize isBold:(BOOL)isBold {
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    if (isBold) {
        button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor colorWithHexString:hexString] forState:(UIControlStateNormal)];
    return button;
}

@end
