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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
        make.width.height.mas_equalTo(50);
    }];
}

- (void)buttonAction {
    [BaseMBProgressHud showMBHudWithText:@"my" position:(PositionTypeTop)];
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
