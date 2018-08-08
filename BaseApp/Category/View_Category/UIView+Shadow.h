//
//  UIView+Shadow.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

/**
 给视图添加阴影
 
 @param shadowColor   阴影颜色
 @param shadowOffset  偏移距离 x ：0上下； <0 上； >0 下    y：0左右 ；<0 左； >0 右
 @param shadowOpacity 不透明度
 @param shadowRadius  半径
 */
- (void)viewShadowWithColor:(UIColor *)shadowColor
                     offset:(CGSize)shadowOffset
                    opacity:(float)shadowOpacity
                     radius:(float)shadowRadius;

@end
