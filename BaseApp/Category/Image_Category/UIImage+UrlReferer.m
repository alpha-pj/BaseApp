//
//  UIImage+UrlReferer.m
//  Lovers
//
//  Created by PeiJun on 2019/6/22.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "UIImage+UrlReferer.h"

@implementation UIImage (UrlReferer)

+ (NSString *)imageUrlDisposeRefererWithUrl:(NSString *)url {
    if ([NSString isBlankString:url]) {
        return nil;
    }
    NSString *imageUrl = url.copy;
    if (![imageUrl hasPrefix:@"http"]) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *referer = [user objectForKey:ImageReferer];
        imageUrl = [NSString stringWithFormat:@"%@%@", referer, imageUrl];
    }
    return imageUrl;
}

@end
