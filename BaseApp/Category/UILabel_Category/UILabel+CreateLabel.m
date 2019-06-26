//
//  UILabel+CreateLabel.m
//  TimeDiary
//
//  Created by PeiJun on 2017/8/15.
//  Copyright © 2017年 brt. All rights reserved.
//

#import "UILabel+CreateLabel.h"

@implementation UILabel (CreateLabel)

+ (UILabel *)createLabelWithTextColorHexString:(NSString *)hexString font:(UIFont *)font alignment:(NSTextAlignment)alignment {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithHexString:hexString];
    label.font = font;
    label.textAlignment = alignment;
    return label;
}

@end
