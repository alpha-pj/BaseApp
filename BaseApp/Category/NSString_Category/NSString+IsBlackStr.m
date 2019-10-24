//
//  NSString+IsBlackStr.m
//  Lovers
//
//  Created by PeiJun on 2017/9/12.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import "NSString+IsBlackStr.h"

@implementation NSString (IsBlackStr)

+ (BOOL)isBlankString:(id)string {
    if (!string)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [string length] == 0)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"(null)"])
    {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] && [string isEqualToString:@"<null>"])
    {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isString:(id)string {
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    return ![NSString isBlankString:string];
}

- (NSString *)stringValue {
    return self;
}

@end
