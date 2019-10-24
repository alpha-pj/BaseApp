//
//  UIImage+SizeForUrl.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SizeForUrl)

/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL;

@end
