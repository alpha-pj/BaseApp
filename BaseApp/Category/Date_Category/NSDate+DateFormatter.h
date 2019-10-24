//
//  NSDate+DateFormatter.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateFormatter)
#pragma mark 通过日期和formatter获取字符串
- (NSString *)dateTimeWithFormatter:(NSString *)formatter;
#pragma mark 通过时间字符串和formatter获取日期
+ (NSDate *)dateWithDateStr:(NSString *)dateStr formatter:(NSString *)formatter;
#pragma mark 根据具体日期返回过去的时间 ex: 1秒前
+ (NSString *)timeAgoFromCommentWithdetailedDate:(NSString *)date DateFomatter:(NSString *)dtfomatter;
#pragma mark 返回时间戳
+ (double)getTimeIntervalWithData:(NSString *)date DateFomatter:(NSString *)datefomatter;
/******************** ex: 18:56  **********************/
+ (NSString *)dateAgoFromCommentWithdetailedDate:(NSString *)date DateFomatter:(NSString *)dtfomatter;

/**
 根据时间戳返回 ex: 18:56

 @param date 时间戳
 */
+ (NSString *)dateAgoFromCommentWithDate:(NSInteger)date;

//获取时间（例如 今天 18:20 ， 昨天 21：02 ，12-23 18:13）
+ (NSString *)dateStrWithDateStr:(NSString *)dateString formate:(NSString *)formate;

//打印券用到
//获取时间（例如 t今天，t一天后, 有效期至：yyyy.MM.dd）是否包含t区分是否大于3天
+ (NSString *)afterDaysWithDateStr:(NSString *)dateString formate:(NSString *)formate;

@end
