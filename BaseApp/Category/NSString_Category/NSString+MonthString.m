//
//  NSString+MonthString.m
//  TimeDiary
//
//  Created by PeiJun on 2017/9/18.
//  Copyright © 2017年 brt. All rights reserved.
//

#import "NSString+MonthString.h"

@implementation NSString (MonthString)

+ (NSString *)monthStringWithString:(NSString *)numString {
    if ([NSString isBlankString:numString]) {
        return @"";
    }
    NSInteger monthNum = numString.integerValue;
    if (monthNum == 0 || monthNum > 12) {
        return @"";
    }
    NSArray *monthArray = [NSArray arrayWithObjects:@"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十", @"十一", @"十二", nil];
    NSString *monthString = [monthArray safeObjectAtIndex:monthNum - 1];
    return [monthString stringByAppendingString:@"月"];
}

@end
