//
//  BaseTabBarController.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/21.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeBaseController.h"
#import "MyBaseController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建子控制器
    HomeBaseController *homeVC=[[HomeBaseController alloc] init];
    MyBaseController *myVC=[[MyBaseController alloc] init];
    
    BaseNavigationController *homeNavi = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
    BaseNavigationController *myNaiv = [[BaseNavigationController alloc] initWithRootViewController:myVC];
    
    [self setTabBarItem:homeNavi.tabBarItem
                  title:@"首页"
              titleFont:[UIFont systemFontOfSize:13.0f]
          selectedImage:[YYImage yy_imageWithColor:[UIColor redColor] size:CGSizeMake(30, 30)]
     selectedTitleColor:[UIColor redColor]
            normalImage:[YYImage yy_imageWithColor:[UIColor grayColor] size:CGSizeMake(30, 30)]
       normalTitleColor:[UIColor grayColor]];
    
    
    [self setTabBarItem:myNaiv.tabBarItem
                  title:@"我的"
              titleFont:[UIFont systemFontOfSize:13.0f]
          selectedImage:[YYImage yy_imageWithColor:[UIColor redColor] size:CGSizeMake(30, 30)]
     selectedTitleColor:[UIColor redColor]
            normalImage:[YYImage yy_imageWithColor:[UIColor grayColor] size:CGSizeMake(30, 30)]
       normalTitleColor:[UIColor grayColor]];
    
    // 把子控制器添加到UITabBarController
    self.viewControllers = @[homeNavi, myNaiv];
}

#pragma mark 设置基本信息
- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
            titleFont:(UIFont *)titleFont
        selectedImage:(UIImage *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(UIImage *)normalImage
     normalTitleColor:(UIColor *)unselectColor
{
    
    // 图片
    tabbarItem = [tabbarItem initWithTitle:title image:[normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // 未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:titleFont} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:titleFont} forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
