//
//  UIImage+GetImageFormate.h
//  TimeDiary
//
//  Created by PeiJun on 2018/6/26.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GetImageFormate)

//根据data获取图片格式
+ (NSString *)typeForImageData:(NSData *)data;

@end
