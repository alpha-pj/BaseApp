//
//  BaseCYLTabBarController.m
//  BaseApp
//
//  Created by PeiJun on 2019/3/20.
//  Copyright © 2019 PeiJun. All rights reserved.
//

#import "BaseCYLTabBarController.h"
#import "HomeBaseController.h"
#import "MyBaseController.h"

@interface BaseCYLTabBarController ()

@end

@implementation BaseCYLTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:[self ViewControllers] tabBarItemsAttributes:[self tabBarItemsAttributes]];
        self = (BaseCYLTabBarController *)tabBarController;
        
        // 未选中字体颜色
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorHexString(@"#737373")} forState:UIControlStateNormal];
        
        // 选中字体颜色
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:ColorHexString(@"#333333")} forState:UIControlStateSelected];
        
        UITabBar *tabbar = [UITabBar appearance];
        [tabbar setBackgroundImage:[UIImage new]];
        [tabbar setShadowImage:[UIImage new]];
        [tabbar setTintColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
}

- (NSArray *)ViewControllers {
    // 创建子控制器
    HomeBaseController *homeVC=[[HomeBaseController alloc] init];
    MyBaseController *myVC=[[MyBaseController alloc] init];
    
    BaseNavigationController *homeNavi = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
    BaseNavigationController *myNaiv = [[BaseNavigationController alloc] initWithRootViewController:myVC];
    
    return @[homeNavi, myNaiv];
}

- (NSArray *)tabBarItemsAttributes {
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"YY",
                            CYLTabBarItemImage : @"tabbar_home_normal",
                            CYLTabBarItemSelectedImage : @"tabbar_home_selected",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"SD",
                            CYLTabBarItemImage : @"tabbar_my_normal",
                            CYLTabBarItemSelectedImage : @"tabbar_my_selected",
                            };
    return @[dict1, dict2];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
