//
//  NSString+NowTimeInterval.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NowTimeInterval)

/**
 获取当前的时间戳

 @return 时间戳字符串格式
 */
+ (NSString *)nwTimeGet;

//精确到毫秒数的当前时间戳
+ (NSString *)nwMillisecondTimeGet;


/**
 获取传入的字符串的时间戳

 @param timeString 传入的时间字符串
 @param format 格式(默认@"yyyy/MM/dd HH:mm:ss"格式)
 @return 时间戳
 */
+ (NSTimeInterval)getTimeIntervalWithTimeString:(NSString *)timeString format:(NSString *)format;


/**
 时间戳转换

 @param TimeInterval 传入的时间戳
 @param format 格式(默认@"yyyy/MM/dd HH:mm:ss"格式)
 @return 时间字符串
 */
+ (NSString *)getTimeStrWithTimeInterval:(NSTimeInterval)TimeInterval  format:(NSString *)format;


/**
 date根据格式转为字符串

 @param date 传入的时间
 @param format 格式(默认@"yyyy/MM/dd HH:mm:ss"格式)
 @return 时间字符串
 */
+ (NSString *)getTimeStrWithDate:(NSDate *)date  format:(NSString *)format;

/**
 返回当前日期

 @return 日期格式 0000-00-00 00:00:00
 */
+ (NSString *)currentDate;


/**
 返回日历日期

 @return 日期格式 0000年00月00日 00:00
 */
+ (NSString *)currentHzDateDayAndTime;
/**
 返回日历日期
 
 @return 日期格式 0000年00月00日
 */
+ (NSString *)currentCalenderDate;

+ (NSString *)currentDateDayAndTime;


/**
    yyyy/MM/dd HH:mm  -->   yyyyMMddHHmm
 */
- (NSString *)timeStyle;
@end
