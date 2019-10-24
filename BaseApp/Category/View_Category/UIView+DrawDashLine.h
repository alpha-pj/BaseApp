//
//  UIView+DrawDashLine.h
//  Lovers
//
//  Created by PeiJun on 2017/8/10.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DrawDashLine)

/**
 设置虚线

 @param lineLength 虚线的宽度
 @param lineSpacing 虚线的间距
 @param lineColor 虚线的颜色
 */
- (void)drawDashLineWithLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

@end
