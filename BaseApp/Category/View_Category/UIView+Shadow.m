//
//  UIView+Shadow.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
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
