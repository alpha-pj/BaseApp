//
//  UIColor+Category.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

//颜色转16进制
+ (NSString *)hexFromUIColor:(UIColor *)color;
//根据int获取color
+ (UIColor *)colorWithInteger:(NSInteger) color;
//颜色转16进制
+ (NSInteger)integerFromUIColor:(UIColor *)color;

@end
