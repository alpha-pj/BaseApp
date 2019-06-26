//
//  UILabel+CreateLabel.h
//  TimeDiary
//
//  Created by PeiJun on 2017/8/15.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CreateLabel)

/**
 创建一个label
 
 @param hexString 字体颜色16进制字符串
 @param font 字体
 @param alignment 对齐方式
 @return 创建好的label
 */
+ (UILabel *)createLabelWithTextColorHexString:(NSString *)hexString font:(UIFont *)font alignment:(NSTextAlignment)alignment;

@end
