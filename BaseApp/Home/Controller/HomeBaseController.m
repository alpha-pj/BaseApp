//
//  HomeBaseController.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/21.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "HomeBaseController.h"
#import "WeatherModel.h"

@interface HomeBaseController ()

@property (nonatomic, strong) NSURLSessionDataTask *task;

@end

@implementation HomeBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
        make.width.height.mas_equalTo(50);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)buttonAction {
    if (self.task) {
        if (self.task.state != NSURLSessionTaskStateCompleted && self.task.state != NSURLSessionTaskStateCanceling) {
            [self.task cancel];
            self.task = nil;
            [BaseMBProgressHud showMBHudWithText:@"取消请求" view:self.view];
        }
    } else {
        [self weatherGet];
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
