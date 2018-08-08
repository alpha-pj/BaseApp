//
//  UIView+Rotating.h
//  TimeDiary
//
//  Created by PeiJun on 2018/5/19.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Rotating)

// 开始旋转
-(void) startRotating;
// 停止旋转
-(void) stopRotating;
// 恢复旋转
-(void) resumeRotate;

@end
