//
//  NSString+NowTimeInterval.m
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "NSString+NowTimeInterval.h"

@implementation NSString (NowTimeInterval)

+ (NSString *)nwTimeGet
{
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld",(NSInteger)time];
}

+ (NSString *)nwMillisecondTimeGet {
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f",time * 1000];
}

+ (NSString *)getTimeStrWithTimeInterval:(NSTimeInterval)TimeInterval  format:(NSString *)format
{
    if ([NSString isBlankString:format]) {
        format = @"yyyy/MM/dd HH:mm:ss";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:TimeInterval];
    NSString *timeStr = [formatter stringFromDate:date];
    return timeStr;
}

+ (NSTimeInterval)getTimeIntervalWithTimeString:(NSString *)timeString  format:(NSString *)format
{
    if ([NSString isBlankString:format]) {
        format = @"yyyy/MM/dd HH:mm:ss";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSDate *date = [formatter dateFromString:timeString];
    NSTimeInterval time = (NSInteger)[date timeIntervalSince1970];
    return time;
}

+ (NSString *)getTimeStrWithDate:(NSDate *)date  format:(NSString *)format
{
    if ([NSString isBlankString:format]) {
        format = @"yyyy/MM/dd HH:mm:ss";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSString *timeStr = [formatter stringFromDate:date];
    return timeStr;
}

+ (NSString *)currentDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    return [formatter stringFromDate:[NSDate date]];
}

/**
 返回日历日期
 
 @return 日期格式 0000年00月00日
 */
+ (NSString *)currentCalenderDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd日";
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)currentHzDateDayAndTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy年MM月dd HH:mm";
    return [formatter stringFromDate:[NSDate date]];
}

+ (NSString *)currentDateDayAndTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm";
    return [formatter stringFromDate:[NSDate date]];
}

- (NSString *)timeStyle {
    NSString *timeInt = [self stringByReplacingOccurrencesOfString:@"/" withString:@""];
    timeInt = [timeInt stringByReplacingOccurrencesOfString:@"-" withString:@""];
    timeInt = [timeInt stringByReplacingOccurrencesOfString:@" " withString:@""];
    timeInt = [timeInt stringByReplacingOccurrencesOfString:@":" withString:@""];
    timeInt = [timeInt stringByReplacingOccurrencesOfString:@"." withString:@""];
    return timeInt;
}

@end
