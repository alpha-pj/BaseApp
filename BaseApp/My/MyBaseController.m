//
//  MyBaseController.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/21.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "MyBaseController.h"
#import "HomeBaseController.h"

@interface MyBaseController ()

@end

@implementation MyBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationItem.title = @"SDWebImage";
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    imageV.backgroundColor = [UIColor whiteColor];
    //SD测试webp
    [imageV sd_setImageWithURL:[NSURL URLWithString:@"http://isparta.github.io/compare-webp/image/png_webp/webp_lossy75/2.webp"]];
    [self.view addSubview:imageV];
    //SD测试gif
    NSURL *gitUrl = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553143850117&di=7edda36c804d73229796380c0f1c6309&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20160912%2Fcfa771329ad9495381f335b7c4def907_th.gif"];
    FLAnimatedImageView *animateImageV = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(200, 250, 100, 100)];
    animateImageV.backgroundColor = [UIColor whiteColor];
    [animateImageV sd_setImageWithURL:gitUrl];
    [self.view addSubview:animateImageV];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(400);
        make.width.height.mas_equalTo(50);
    }];
}

- (void)buttonAction {
    [BaseMBProgressHud showMBHudWithView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BaseMBProgressHud hideMBHudWithView:self.view];
        [BaseMBProgressHud showMBHudWithText:@"SDWebImage加载Webp和Gif" view:self.view position:(PositionTypeBottom)];
    });
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
