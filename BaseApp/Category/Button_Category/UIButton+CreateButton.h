//
//  UIButton+CreateButton.h
//  TimeDiary
//
//  Created by PeiJun on 2018/7/9.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CreateButton)

+ (UIButton *)createButtonWithTextColorHexString:(NSString *)hexString title:(NSString *)title fontSize:(CGFloat)fontSize isBold:(BOOL)isBold;

@end
