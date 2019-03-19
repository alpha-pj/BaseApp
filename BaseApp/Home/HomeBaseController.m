//
//  HomeBaseController.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/21.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "HomeBaseController.h"
#import "MyBaseController.h"

@interface HomeBaseController ()

@end

@implementation HomeBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //测试
    [imageV yy_setImageWithURL:[NSURL URLWithString:@"http://isparta.github.io/compare-webp/image/png_webp/webp_lossy75/2.webp"] options:(YYWebImageOptionProgressive)];
//    [imageV sd_setImageWithURL:[NSURL URLWithString:@"http://isparta.github.io/compare-webp/image/png_webp/webp_lossy75/2.webp"]];
    [self.view addSubview:imageV];
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
