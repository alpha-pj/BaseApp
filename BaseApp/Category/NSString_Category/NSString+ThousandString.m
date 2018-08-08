//
//  NSString+ThousandString.m
//  TimeDiary
//
//  Created by PeiJun on 2017/3/29.
//  Copyright © 2017年 brt. All rights reserved.
//

#import "NSString+ThousandString.h"

@implementation NSString (ThousandString)

+ (NSString *)getTenThousandStringWithNumber:(NSNumber *)number
{
    NSString *changedStr = @"";
    if (number.integerValue >= 10000) {
        CGFloat fNum = [number integerValue] / 10000.0f;
        changedStr = [NSString stringWithFormat:@"%.1f万",fNum];
    } else {
        changedStr = [NSString stringWithFormat:@"%@",number];
    }
    return changedStr;
}

@end
