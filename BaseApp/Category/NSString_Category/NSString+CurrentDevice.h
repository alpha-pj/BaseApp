//
//  NSString+CurrentDevice.h
//  TimeDiary
//
//  Created by PeiJun on 2017/4/25.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CurrentDevice)

+ (NSString*)deviceInfo;
    
//是否是iphonex系列
+ (BOOL)isiPhoneX;

@end
