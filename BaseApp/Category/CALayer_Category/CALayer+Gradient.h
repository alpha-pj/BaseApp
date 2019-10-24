//
//  CALayer+Gradient.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSUInteger, FromDirection) {
    FromDirectionTop,
    FromDirectionLeft,
    FromDirectionTopLeft,
    FromDirectionTopRight,
};

@interface CALayer (Gradient)

/**
 CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
 
 @param view 要改变的视图
 @param direction 从什么方向开始
 @param fromHexColorStr 起始颜色
 @param toHexColorStr 最终颜色
 @return layer
 */
+ (CAGradientLayer *)setGradualChangingColorWithView:(UIView *)view direction:(FromDirection)direction fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

@end
