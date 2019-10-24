//
//  CALayer+Gradient.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "CALayer+Gradient.h"

@implementation CALayer (Gradient)

+ (CAGradientLayer *)setGradualChangingColorWithView:(UIView *)view direction:(FromDirection)direction fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr {
    @autoreleasepool {
        //移除之前的CAGradientLayer
        NSMutableArray *layers = [NSMutableArray array];
        if (view.layer.sublayers.count > 0) {
            for (CALayer *layer in view.layer.sublayers) {
                if ([layer isKindOfClass:[CAGradientLayer class]]) {
                    [layers addObject:layer];
                }
            }
        }
        for (CAGradientLayer *layer in layers) {
            [layer removeFromSuperlayer];
        }
    }
    //CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    //创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHexString:toHexColorStr].CGColor];
    //设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    switch (direction) {
        case FromDirectionTop:
        {
            gradientLayer.startPoint = CGPointMake(0.5, 0);
            gradientLayer.endPoint = CGPointMake(0.5, 1);
        }
            break;
        case FromDirectionLeft:
        {
            gradientLayer.startPoint = CGPointMake(0, 0.5);
            gradientLayer.endPoint = CGPointMake(1, 0.5);
        }
            break;
        case FromDirectionTopLeft:
        {
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1, 1);
        }
            break;
        case FromDirectionTopRight:
        {
            gradientLayer.startPoint = CGPointMake(0, 1);
            gradientLayer.endPoint = CGPointMake(1, 0);
        }
            break;
            
        default:
            break;
    }
    //设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}

@end
