//
//  BaseMJGifHeader.m
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "BaseMJGifHeader.h"

@implementation BaseMJGifHeader

- (void)prepare
{
    [super prepare];
//    self.lastUpdatedTimeLabel.hidden = YES;
//    self.stateLabel.hidden = YES;
//    self.stateLabel.textColor = [UIColor colorWithHexString:@"#989898"];
//    self.stateLabel.font = [UIFont systemFontOfSize:13];
//    // 设置普通状态的动画图片
//    NSMutableArray *idleImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i <= 5; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"mj_refresh_icon%ld", i]];
//        [idleImages addObject:image];
//    }
//    [self setImages:idleImages forState:MJRefreshStateIdle];
//    [self setTitle:KLocalStr(@"DropRefresh", @"下拉刷新") forState:MJRefreshStateIdle];
//    [self setImages:idleImages duration:1.5 forState:MJRefreshStateIdle];
//    
//    [self setImages:idleImages forState:MJRefreshStatePulling];
//    [self setTitle:KLocalStr(@"LoosenImmediateRefresh", @"释放立即刷新") forState:MJRefreshStatePulling];
//    [self setImages:idleImages duration:1.5 forState:MJRefreshStatePulling];
//    
//    [self setImages:idleImages forState:MJRefreshStateRefreshing];
//    [self setTitle:KLocalStr(@"Loading", @"正在加载...") forState:MJRefreshStateRefreshing];
//    [self setImages:idleImages duration:2 forState:MJRefreshStateRefreshing];
}

@end
