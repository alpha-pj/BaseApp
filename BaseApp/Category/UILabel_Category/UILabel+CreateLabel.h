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
 @param fontSize 字体大小
 @return 创建好的label
 */
+ (UILabel *)createLabelWithTextColorHexString:(NSString *)hexString fontSize:(CGFloat)fontSize;

+ (UILabel *)createLabelWithTextColorHexString:(NSString *)hexString boldFontSize:(CGFloat)fontSize;

@end
