//
//  UIImage+GetImageFormate.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "UIImage+GetImageFormate.h"

@implementation UIImage (GetImageFormate)

+ (NSString *)typeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
            
        case 0x4D:
            return @"tiff";
    }
    return nil;
}

@end
