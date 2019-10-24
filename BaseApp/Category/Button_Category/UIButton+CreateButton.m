//
//  UIButton+CreateButton.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
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
