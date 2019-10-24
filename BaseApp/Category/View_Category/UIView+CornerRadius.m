//
//  UIView+CornerRadius.m
//  Lovers
//
//  Created by PeiJun on 2017/4/5.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)setCornerRadiiWithRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setCornerRadiiWithRoundCornerTopLeft:(CGFloat)topLeft TopRight:(CGFloat)topRight bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft {
    UIBezierPath *maskPath = [UIBezierPath bezierPath];
    [maskPath addArcWithCenter:CGPointMake(topLeft, topLeft) radius:topLeft startAngle:M_PI endAngle:1.5 * M_PI clockwise:YES];
    [maskPath addLineToPoint:CGPointMake(self.width - topRight, 0)];
    [maskPath addArcWithCenter:CGPointMake(self.width - topRight, topRight) radius:topRight startAngle:1.5 * M_PI endAngle:0 clockwise:YES];
    [maskPath addLineToPoint:CGPointMake(self.width, self.height - bottomRight)];
    [maskPath addArcWithCenter:CGPointMake(self.width - bottomRight, self.height - bottomRight) radius:bottomRight startAngle:0 endAngle:0.5 * M_PI clockwise:YES];
    [maskPath addLineToPoint:CGPointMake(bottomLeft, self.height)];
    [maskPath addArcWithCenter:CGPointMake(bottomLeft, self.height - bottomLeft) radius:bottomLeft startAngle:0.5 * M_PI endAngle:M_PI clockwise:YES];
    [maskPath closePath];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
