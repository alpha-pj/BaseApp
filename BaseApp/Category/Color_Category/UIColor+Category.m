//
//  UIColor+Category.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}
//颜色转16进制
+ (NSString *)hexFromUIColor:(UIColor *)color {
    if ([color isEqual:[UIColor clearColor]]) {
        return @"";
    }
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (0 == (CGColorGetComponents(color.CGColor))[3]) {
        return @"";
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return @"";
    }
    return [NSString stringWithFormat:@"#%02x%02x%02x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}
//根据int获取color
+ (UIColor *)colorWithInteger:(NSInteger) color {
    if (0 == color) {
        return [UIColor clearColor];
    }
    NSInteger alpha = (color & 0xff000000) >> 24;
    NSInteger red = (color & 0x00ff0000) >> 16;
    NSInteger green = (color & 0x0000ff00) >> 8;
    NSInteger blue = (color & 0x000000ff);
    UIColor *col = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha / 255.0];
    return col;
}

//颜色转16进制
+ (NSInteger)integerFromUIColor:(UIColor *)color {
    if (!color || [color isEqual:[UIColor clearColor]]) {
        return 0;
    }
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    NSInteger red = (NSInteger)(components[0] * 255.0);
    NSInteger green = (NSInteger)(components[1] * 255.0);
    NSInteger blue = (NSInteger)(components[2] * 255.0);
    NSInteger alpha = (NSInteger)(components[3] * 255.0);
    return ((alpha << 24) + (red << 16) + (green << 8) + blue);
}

@end
