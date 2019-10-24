//
//  UIButton+CreateButton.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
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
