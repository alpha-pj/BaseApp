//
//  MyBaseController.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/21.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "MyBaseController.h"

#import "WeatherModel.h"

@interface MyBaseController ()

@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@implementation MyBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    if (_showWeather) {
        self.navigationItem.title = @"天气";
    } else {
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
    }
    
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
    if (_showWeather) {
        if (self.task) {
            if (self.task.state != NSURLSessionTaskStateCompleted && self.task.state != NSURLSessionTaskStateCanceling) {
                [self.task cancel];
                self.task = nil;
                [BaseMBProgressHud showMBHudWithText:@"取消请求" view:self.view];
            }
        } else {
            [self weatherGet];
        }
    } else {
        [BaseMBProgressHud showMBHudWithView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [BaseMBProgressHud hideMBHudWithView:self.view];
            [BaseMBProgressHud showMBHudWithText:@"SDWebImage加载Webp和Gif" view:self.view position:(PositionTypeCenter)];
        });
    }
}

- (void)weatherGet {
    self.task = [BaseRequest getWeatherWithCity:@"南京" progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *data = responseObject[@"data"];
            if ([data isKindOfClass:[NSDictionary class]]) {
                WeatherModel *model = [[WeatherModel alloc] init];
                [model setValuesForKeysWithDictionary:data];
                UILabel *label = [[UILabel alloc] init];
                label.font = [UIFont boldSystemFontOfSize:18];
                label.numberOfLines = 0;
                label.text = [NSString stringWithFormat:@"城市：%@\n时间：%@\n当前温度：%@℃\n整体温度：%@，%@\n天气状况：%@\n风向：%@\n温馨提示：%@\n", model.city, [[model.forecast firstObject] date], model.wendu, [[model.forecast firstObject] low], [[model.forecast firstObject] high], [[model.forecast firstObject] type], [[model.forecast firstObject] fengxiang], model.ganmao];
                [self.view addSubview:label];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_lessThanOrEqualTo(ScreenWidth - 20);
                    make.height.mas_greaterThanOrEqualTo(0);
                    make.left.top.mas_equalTo(10);
                }];
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
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
