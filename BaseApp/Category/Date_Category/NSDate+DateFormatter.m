//
//  NSDate+DateFormatter.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "NSDate+DateFormatter.h"

@implementation NSDate (DateFormatter)

- (NSString *)dateTimeWithFormatter:(NSString *)formatter
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatter;
    return [format stringFromDate:self];
}

#pragma mark 通过时间字符串和formatter获取日期
+ (NSDate *)dateWithDateStr:(NSString *)dateStr formatter:(NSString *)formatter {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = formatter;
    return [format dateFromString:dateStr];
}

/******************** 根据具体日期返回过去的时间 ex: 1秒前 **********************/
+ (NSString *)timeAgoFromCommentWithdetailedDate:(NSString *)date DateFomatter:(NSString *)dtfomatter
{
    if ([NSString isBlankString:date]) {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dtfomatter;
    NSDate *theDate = [formatter dateFromString:date];
    NSTimeInterval time = [theDate timeIntervalSince1970];
    return [self timeAgoFromCommentWithDate:(int)time];
}
//返回时间戳
+ (double)getTimeIntervalWithData:(NSString *)date DateFomatter:(NSString *)datefomatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = datefomatter;
    NSDate *theDate = [formatter dateFromString:date];
    NSTimeInterval time = [theDate timeIntervalSince1970];
    return time;
}

+ (NSString *)timeAgoFromCommentWithDate:(int)date {
    NSInteger timeNum;
    NSInteger nwTime = [[NSString nwTimeGet] intValue];
    timeNum = nwTime - date;
    if (timeNum <= 0) // 秒
    {
        return @"刚刚";
    }
    if (timeNum > 0 && timeNum < 60) // 秒
    {
        return [NSString stringWithFormat:@"%ld秒前", timeNum];
    }
    else if (timeNum >= 60 && timeNum < 60 * 60)
    {
        return [NSString stringWithFormat:@"%ld分钟前", timeNum / 60];
    }
    else if (timeNum >= 60 * 60 && timeNum < 24 * 60 * 60)
    {
        return [NSString stringWithFormat:@"%ld小时前", timeNum / (60 * 60)];
    }
    else if (timeNum >= 24 * 60 * 60 && timeNum < 7 * 24 * 60 * 60)
    {
        return [NSString stringWithFormat:@"%ld天前", timeNum / (24 * 60 * 60)];
    }
    else if (timeNum >= 7 * 24 * 60 * 60 && timeNum < 30 * 24 * 60 * 60)
    {
        return [NSString stringWithFormat:@"%ld个星期前", timeNum / (7 * 24 * 60 * 60)];
    }
    else
        return [NSString stringWithFormat:@"%ld个月前", timeNum / (30 * 24 * 60 * 60)];
}

+ (NSString *)dateAgoFromCommentWithDate:(NSInteger)date {
    NSInteger timeNum;
    NSInteger nwTime = [[NSString nwTimeGet] intValue];
    timeNum = nwTime - date;
    //传入的时间
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:date];
    //当前的时间
    NSDate *currentDate = [NSDate dateWithTimeIntervalSince1970:nwTime];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //今天0点到现在的时间戳
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *nowDate = [NSDate date];
    NSDate *todayDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:nowDate]];
    NSTimeInterval nowTime = [nowDate timeIntervalSinceDate:todayDate];
    if (timeNum <= 60 * 60 * 24 + nowTime) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString * need_yMd = [dateFormatter stringFromDate:detaildate];
        NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
        [dateFormatter setDateFormat:@"HH:mm"];
        NSString *detailDateStr = nil;
        if ([need_yMd isEqualToString:now_yMd]) {
            // 在同一天
            detailDateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:detaildate]];
        }else{
            // 昨天
            detailDateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:detaildate]];
        }
        return detailDateStr;
    } else {
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
        //传入的时间
        NSString *detailDateStr = [dateFormatter stringFromDate: detaildate];
        //当前的时间
        NSString *currentDateStr = [dateFormatter stringFromDate: currentDate];
        if (detailDateStr.length > 4 && currentDateStr.length > 4 && [[detailDateStr substringToIndex:4] isEqualToString:[currentDateStr substringToIndex:4]]) {
            //同一年
            [dateFormatter setDateFormat:@"MM/dd HH:mm"];
            NSString *detailDateStr = [dateFormatter stringFromDate: detaildate];
            return detailDateStr;
        } else {
            return detailDateStr;
        }
    }
}

/******************** ex: 18:56 **********************/
+ (NSString *)dateAgoFromCommentWithdetailedDate:(NSString *)date DateFomatter:(NSString *)dtfomatter
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = dtfomatter;
    NSDate *theDate = [formatter dateFromString:date];
    NSTimeInterval time = [theDate timeIntervalSince1970];
    return [self dateAgoFromCommentWithDate:(NSInteger)time];
}

+ (NSString *)dateStrWithDateStr:(NSString *)dateString formate:(NSString *)formate {
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        NSDate * nowDate = [NSDate date];
        //  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        //  取当前时间和转换时间两个日期对象的时间间隔
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        //今天0点到现在的时间戳
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *todayDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:nowDate]];
        NSTimeInterval nowTime = [nowDate timeIntervalSinceDate:todayDate];
        // 再然后，把间隔的秒数折算成天数和小时数：
        NSString *dateStr = @"";
        if (time <= 60 * 60 * 24 + nowTime) {   // 在近两天内的
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                // 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                //  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        } else {
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            if ([yearStr isEqualToString:nowYear]) {
                //  在同一年
                [dateFormatter setDateFormat:@"MM-dd HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yy-MM-dd HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+ (NSString *)afterDaysWithDateStr:(NSString *)dateString formate:(NSString *)formate {
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        NSDate * nowDate = [NSDate date];
        //  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        //  取当前时间和转换时间两个日期对象的时间间隔
        //  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [needFormatDate timeIntervalSince1970];
        //获取当天到0点的时间戳
        [dateFormatter setDateFormat:@"yyyyMMdd"];
        NSDate *todayDate = [dateFormatter dateFromString:[dateFormatter stringFromDate:nowDate]];
        NSTimeInterval nowTime = [todayDate timeIntervalSince1970];
        // 再然后，把间隔的秒数折算成天数和小时数：
        NSTimeInterval afterTime = time - nowTime;
        NSString *dateStr = @"";
        if (afterTime >= 0) {
            if (afterTime <= 60 * 60 * 24) {   // 在近两天内的
                [dateFormatter setDateFormat:@"yyyyMMdd"];
                NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
                NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
                if ([need_yMd isEqualToString:now_yMd]) {
                    // 在同一天
                    dateStr = @"t今日到期";
                }else{
                    //  昨天
                    dateStr = @"t明日到期";
                }
            } else if (afterTime <= 60 * 60 * 24 * 2) {
                dateStr = @"t2天后到期";
            } else {
                [dateFormatter setDateFormat:@"有效期至：yyyy.MM.dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        } else {
            [dateFormatter setDateFormat:@"有效期至：yyyy.MM.dd"];
            dateStr = [dateFormatter stringFromDate:needFormatDate];
        }
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

@end
