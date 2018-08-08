//
//  UIView+Rotating.m
//  TimeDiary
//
//  Created by PeiJun on 2018/5/19.
//  Copyright © 2018年 brt. All rights reserved.
//

#import "UIView+Rotating.h"

@implementation UIView (Rotating)

#pragma mark 按钮旋转
// 开始旋转
-(void) startRotating {
    CABasicAnimation* rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2];   // 旋转一周
    rotateAnimation.duration = 2.0;                                 // 旋转时间20秒
    rotateAnimation.repeatCount = MAXFLOAT;                          // 重复次数，这里用最大次数
    
    [self.layer addAnimation:rotateAnimation forKey:nil];
}

// 停止旋转
-(void) stopRotating {
    if (self.layer.timeOffset != 0) {
        self.layer.speed = 0.0;                                          // 停止旋转
    }
//    self.layer.timeOffset = 0;
}

// 恢复旋转
-(void) resumeRotate {
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    if (self.layer.timeOffset == 0) {
        self.layer.timeOffset = pausedTime;
        [self startRotating];
        return;
    }
    self.layer.speed = 1.0;                                         // 开始旋转
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;                                             // 恢复时间
    self.layer.beginTime = timeSincePause;                          // 从暂停的时间点开始旋转
}

@end
