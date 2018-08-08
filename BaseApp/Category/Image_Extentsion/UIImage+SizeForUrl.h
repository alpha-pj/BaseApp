//
//  UIImage+SizeForUrl.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SizeForUrl)

/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL;

@end
