//
//  UIView+CornerRadius.h
//  TimeDiary
//
//  Created by PeiJun on 2017/4/5.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)


/**
 为视图设置指定位置（四个角）圆角

 @param corners 需要设置的圆角的位置
 @param cornerRadii 圆角大小
 @return 返回视图
 */
- (void)setCornerRadiiWithRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

/**
 为视图设定四个不同圆角

 @param topLeft 左上圆角大小
 @param topRight 右上圆角大小
 @param bottomRight 右上圆角大小
 @param bottomLeft 左下圆角大小
 */
- (void)setCornerRadiiWithRoundCornerTopLeft:(CGFloat)topLeft TopRight:(CGFloat)topRight bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft;

@end
