//
//  UIImage+GetImageFormate.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GetImageFormate)

//根据data获取图片格式
+ (NSString *)typeForImageData:(NSData *)data;

@end
