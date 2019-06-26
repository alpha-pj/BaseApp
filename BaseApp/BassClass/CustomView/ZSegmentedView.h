//
//  ZSegmentedView.h
//  TimeDiary
//
//  Created by PeiJun on 2019/1/11.
//  Copyright © 2019 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSegmentedView : UIView

+ (instancetype)viewWithTitles:(NSArray *)titles cornerRadius:(CGFloat)cornerRadius selectedColor:(UIColor *)selectedColor normalColor:(UIColor *)normalColor;

@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSInteger selectedSegmentIndex;
@property (nonatomic, copy) void (^selectedBlock)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
