//
//  UIButton+BackButton.m
//  Lovers
//
//  Created by PeiJun on 2019/6/11.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "UIButton+BackButton.h"

@implementation UIButton (BackButton)

+ (UIButton *)backButton {
    UIButton *backBt = [UIButton buttonWithType:UIButtonTypeCustom];
    backBt.frame = CGRectMake(0, STATUS_BAR_HEIGHT, 44, 44);
    backBt.imageView.contentMode = UIViewContentModeScaleAspectFit;
    backBt.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, - 5);
    [backBt setImage:[UIImage imageNamed:@"back_normal"] forState:(UIControlStateNormal)];
    [backBt setImage:[UIImage imageNamed:@"back_highlighted"] forState:(UIControlStateHighlighted)];
    return backBt;
}

@end
