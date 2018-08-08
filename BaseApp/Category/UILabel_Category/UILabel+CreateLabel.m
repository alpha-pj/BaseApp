//
//  UILabel+CreateLabel.m
//  TimeDiary
//
//  Created by PeiJun on 2017/8/15.
//  Copyright © 2017年 brt. All rights reserved.
//

#import "UILabel+CreateLabel.h"

@implementation UILabel (CreateLabel)

+ (UILabel *)createLabelWithTextColorHexString:(NSString *)hexString fontSize:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithHexString:hexString];
    if (!fontSize) {
        fontSize = 10;
    }
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

+ (UILabel *)createLabelWithTextColorHexString:(NSString *)hexString boldFontSize:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithHexString:hexString];
    if (!fontSize) {
        fontSize = 10;
    }
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    return label;
}

@end
