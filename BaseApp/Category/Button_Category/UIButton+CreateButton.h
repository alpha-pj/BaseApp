//
//  UIButton+CreateButton.h
//  TimeDiary
//
//  Created by PeiJun on 2018/7/9.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CreateButton)

/**
 创建button
 
 @param hexString 颜色
 @param title 标题
 @param font 字体
 @return button
 */
+ (UIButton *)createButtonWithTextColorHexString:(NSString *)hexString title:(NSString *)title font:(UIFont *)font;

@end
