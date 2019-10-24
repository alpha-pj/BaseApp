//
//  UIImage+Compress.h
//  Lovers
//
//  Created by PeiJun on 2019/6/15.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Compress)


/**
 png最大分辨率限制
 */
- (UIImage *)compressPNGImageWithMaxPx:(CGFloat)maxPx;

/**
 jpg最大分辨率限制
 */
- (UIImage *)compressJPGImageWithMaxPx:(CGFloat)maxPx;

@end

NS_ASSUME_NONNULL_END
