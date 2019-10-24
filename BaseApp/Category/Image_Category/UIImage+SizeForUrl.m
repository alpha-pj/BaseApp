//
//  UIImage+SizeForUrl.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "UIImage+SizeForUrl.h"

@implementation UIImage (SizeForUrl)

/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL{
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *refer = [user objectForKey:ImageReferer];
    NSURL * url = nil;
    NSURL *sBaseURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@",refer]];
    if ([URL isKindOfClass:[NSURL class]]) {
        url = URL;
    }
    if ([URL isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:URL relativeToURL:sBaseURL];
        
    }
    if (!URL) {
        return CGSizeZero;
    }
    CGImageSourceRef imageSourceRef =     CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0, height = 0;
    if (imageSourceRef) {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        if (imageProperties != NULL) {
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
            CFRelease(imageProperties);
        }
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}

@end
