//
//  BaseCYLPlusButton.m
//  BaseApp
//
//  Created by PeiJun on 2019/3/20.
//  Copyright © 2019 PeiJun. All rights reserved.
//

#import "BaseCYLPlusButton.h"

#import "MyBaseController.h"

@interface BaseCYLPlusButton () <CYLPlusButtonSubclassing>

@end

@implementation BaseCYLPlusButton

+ (id)plusButton {
    BaseCYLPlusButton *plusButton = [BaseCYLPlusButton buttonWithType:(UIButtonTypeCustom)];
    plusButton.frame = CGRectMake(0, 0, 100, 100);
    [plusButton setImage:[UIImage imageNamed:@"tabbar_plus"] forState:(UIControlStateNormal)];
    [plusButton addTarget:plusButton action:@selector(plusButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    return plusButton;
}

- (void)plusButtonAction:(BaseCYLPlusButton *)button {
    CYLTabBarController *tabBarController = [self cyl_tabBarController];
    UIViewController *viewController = tabBarController.selectedViewController;
    
    MyBaseController *vc = [[MyBaseController alloc] init];
    vc.showWeather = YES;
    if ([viewController isMemberOfClass:[UIViewController class]]) {
        [viewController.navigationController pushViewController:vc animated:YES];
    } else if ([viewController isMemberOfClass:[BaseNavigationController class]]) {
        [(BaseNavigationController *)viewController pushViewController:vc animated:YES];
    }
}

+ (CGFloat)constantOfPlusButtonCenterYOffsetForTabBarHeight:(CGFloat)tabBarHeight {
    return - HOME_INDICATOR_HEIGHT;
}

@end
