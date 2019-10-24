//
//  UIImage+Compress.m
//  Lovers
//
//  Created by PeiJun on 2019/6/15.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "UIImage+Compress.h"
#import "UIImage+FixOrientation.h"

@implementation UIImage (Compress)

//png最大分辨率限制
- (UIImage *)compressPNGImageWithMaxPx:(CGFloat)maxPx
{
    @autoreleasepool {
        UIImage *fixImage = [UIImage fixOrientation:self];
        CGImageRef imageRef = [fixImage CGImage];
        CGSize size = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));//这个size就是实际图片的像素大小
        CGFloat width = size.width;
        CGFloat height = size.height;
        CGFloat thumbW = width > height ? height : width;
        CGFloat thumbH = width < height ? height : width;
        CGFloat rotate = thumbW / thumbH;
        // 裁剪到宽度小于maxPx
        if (thumbW > maxPx) {
            thumbW = maxPx;
            thumbH = thumbW / rotate;
            if (width > height) {
                fixImage = [self reDrawImage:fixImage size:CGSizeMake(thumbH, thumbW)];
            }
            else
            {
                fixImage = [self reDrawImage:fixImage size:CGSizeMake(thumbW, thumbH)];
            }
            
        }
        UIImage *image = [UIImage imageWithData:UIImagePNGRepresentation(fixImage)];
        return  image;
    }
}

//jpg最大分辨率限制
- (UIImage *)compressJPGImageWithMaxPx:(CGFloat)maxPx
{
    
    @autoreleasepool {
        UIImage *fixImage = [UIImage fixOrientation:self];
        CGImageRef imageRef = [fixImage CGImage];
        CGSize size = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));//这个size就是实际图片的像素大小
        CGFloat width = size.width;
        CGFloat height = size.height;
        CGFloat thumbW = width > height ? height : width;
        CGFloat thumbH = width < height ? height : width;
        CGFloat rotate = thumbW / thumbH;
        // 裁剪到宽度小于maxPx
        if (thumbW > maxPx) {
            thumbW = maxPx;
            thumbH = thumbW / rotate;
            if (width > height) {
                fixImage = [self reDrawImage:fixImage size:CGSizeMake(thumbH, thumbW)];
            }
            else
            {
                fixImage = [self reDrawImage:fixImage size:CGSizeMake(thumbW, thumbH)];
            }
            
        }
        NSData *data = UIImageJPEGRepresentation(fixImage, 1.0);
        if (data.length / 1024.f > 300) {
            return [UIImage imageWithData:[fixImage compressWithStrength:9 maxSize:300 minStrength:5]];
        } else {
            return [UIImage imageWithData:data];
        }
    }
}

- (UIImage *)reDrawImage:(UIImage *)image size:(CGSize)size
{
    @autoreleasepool {
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0,0, size.width, size.height)];
        UIImage *newImage =UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    
}

- (NSData *)compressWithStrength:(int)strength maxSize:(int)maxSize minStrength:(int)minStrength
{
    @autoreleasepool {
        NSData *data = UIImageJPEGRepresentation(self, strength * 0.1);
        unsigned long long dataLength = data.length / 1024.f;
        // 看data是否小于限定值
        if (dataLength > maxSize) {
            if (strength > minStrength) {
                [self compressWithStrength:(strength - 1) maxSize:maxSize minStrength:minStrength];
            } else {
                return data;
            }
        }
        return data;
    }
}

@end
