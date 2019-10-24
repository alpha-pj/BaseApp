//
//  UIButton+ImageTitleSpacing.h
//  BaseApp
//
//  Created by PeiJun on 2019/6/10.
//  Copyright © 2019 PeiJun. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsStyleTop, // image在上，label在下
    ButtonEdgeInsetsStyleLeft, // image在左，label在右
    ButtonEdgeInsetsStyleBottom, // image在下，label在上
    ButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (ImageTitleSpacing)

/**
 设置button的titleLabel和imageView的布局样式、间距及是否保留已设置的EdgeInsets

 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 @param isRetain 是否保留已设置的EdgeInsets
 */
- (void)buttonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
                  imageTitleSpace:(CGFloat)space
                         isRetain:(BOOL)isRetain;

@end

NS_ASSUME_NONNULL_END
