//
//  UIImage+UrlReferer.h
//  Lovers
//
//  Created by PeiJun on 2019/6/22.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (UrlReferer)


/**
 图片地址没有http开头的处理

 @param url 图片地址
 @return 处理后的地址（加referer）
 */
+ (NSString *)imageUrlDisposeRefererWithUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
