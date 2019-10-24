//
//  NSString+CurrentDevice.h
//  Lovers
//
//  Created by PeiJun on 2017/4/25.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CurrentDevice)

+ (NSString*)deviceInfo;
    
+ (BOOL)isFullScreen;

+ (UIEdgeInsets)safeAreaInsets;

@end
