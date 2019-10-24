//
//  UIView+Frame.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign, readonly) CGFloat maxX;
@property (nonatomic, assign, readonly) CGFloat maxY;

@property (nonatomic, assign, readonly) CGFloat minX;
@property (nonatomic, assign, readonly) CGFloat minY;

@end
