//
//  UIView+Shadow.m
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)

- (void)viewShadowWithColor:(UIColor *)shadowColor
                    offset:(CGSize)shadowOffset
                   opacity:(float)shadowOpacity
                    radius:(float)shadowRadius
{
    self.clipsToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
}

@end
