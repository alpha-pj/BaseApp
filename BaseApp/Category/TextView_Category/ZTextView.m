//
//  ZTextView.m
//  KoreanFans
//
//  Created by PeiJun on 2016/12/7.
//  Copyright © 2016年 PeiJun. All rights reserved.
//

#import "ZTextView.h"

@interface ZTextView ()


@end

@implementation ZTextView

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidBeginEditingNotification object:nil];
    }
    return self;
}

- (void)textDidChange {
    self.placeholderLb.hidden = self.hasText;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    self.placeholderLb.hidden = self.hasText;
    if (self.textChangedBlock) {
        self.textChangedBlock(self);
    }
}

-(UILabel *)placeholderLb {
    if (!_placeholderLb) {
        _placeholderLb = [[UILabel alloc] init];
        _placeholderLb.numberOfLines = 0;
        _placeholderLb.textColor = [UIColor colorWithHexString:@"#999999"];
        if (self.font.pointSize > 0) {
            _placeholderLb.font = [UIFont systemFontOfSize:self.font.pointSize];
        }
        [self addSubview:_placeholderLb];
    }
    return _placeholderLb;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLb.font = [UIFont fontWithName:font.fontName size:font.pointSize];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.placeholderLb.text = placeholder;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.font.pointSize > 0) {
        _placeholderLb.font = [UIFont systemFontOfSize:self.font.pointSize];
    }
}

@end
