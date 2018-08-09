//
//  UIImage+FixOrientation.h
//  TimeDiary
//
//  Created by PeiJun on 2017/4/13.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface UIImage (FixOrientation)

+ (UIImage *)fixOrientation:(UIImage *)aImage;

/*旋转图片*/
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

@end
