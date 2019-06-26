//
//  ZSegmentedView.m
//  TimeDiary
//
//  Created by PeiJun on 2019/1/11.
//  Copyright © 2019 brt. All rights reserved.
//

#import "ZSegmentedView.h"

@interface ZSegmentedView ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIView *backView;

@end

@implementation ZSegmentedView

+ (instancetype)viewWithTitles:(NSArray *)titles cornerRadius:(CGFloat)cornerRadius selectedColor:(UIColor *)selectedColor normalColor:(UIColor *)normalColor {
    ZSegmentedView *segment = [[ZSegmentedView alloc] init];
    segment.layer.cornerRadius = cornerRadius;
    segment.layer.masksToBounds = YES;
    segment.backgroundColor = normalColor;
    [segment createWithTitles:titles cornerRadius:cornerRadius selectedColor:selectedColor];
    return segment;
}

- (void)createWithTitles:(NSArray *)titles cornerRadius:(CGFloat)cornerRadius selectedColor:(UIColor *)selectedColor {
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = selectedColor;
    self.backView.layer.cornerRadius = cornerRadius;
    self.backView.layer.masksToBounds = YES;
    [self addSubview:self.backView];
    
    NSMutableArray *buttons = [NSMutableArray array];
    self.buttons = buttons;
    for (NSInteger i = 0; i < titles.count; i ++) {
        NSString *title = [titles safeObjectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.tag = 100 + i;
        button.adjustsImageWhenHighlighted = NO;
        button.titleLabel.font = AppFontNormal(15);
        [button setTitle:title forState:(UIControlStateNormal)];
        [button setTitleColor:ColorHexString(@"#585F66") forState:(UIControlStateNormal)];
        [button setTitleColor:ColorHexString(@"#ffffff") forState:(UIControlStateSelected)];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        if (i == 0) {
            button.selected = YES;
        }
        [self addSubview:button];
        [buttons addObject:button];
    }
    [buttons mas_distributeViewsAlongAxis:(MASAxisTypeHorizontal) withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.height.mas_equalTo(self.mas_height);
    }];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(buttons.firstObject);
    }];
}

- (void)buttonAction:(UIButton *)button {
    NSInteger index = button.tag - 100;
    for (UIButton *bt in self.buttons) {
        if (bt == button) {
            bt.selected = YES;
            [self.backView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(bt);
            }];
            // 告诉self.view约束需要更新
            [self setNeedsUpdateConstraints];
            // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
            [self updateConstraintsIfNeeded];
            [UIView animateWithDuration:0.1 animations:^{
                [self layoutIfNeeded];
            }];
        } else {
            bt.selected = NO;
        }
    }
    if (self.selectedBlock) {
        self.selectedBlock(index);
        _selectedSegmentIndex = index;
    }
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    for (UIButton *bt in self.buttons) {
        if (bt.tag - 100 == selectedSegmentIndex) {
            bt.selected = YES;
            [self.backView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(bt);
            }];
        } else {
            bt.selected = NO;
        }
    }
}

- (void)setTextFont:(UIFont *)textFont {
    for (UIButton *button in self.buttons) {
        button.titleLabel.font = textFont;
    }
}

@end
