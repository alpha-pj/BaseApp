//
//  NSString+DateToAge.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "NSString+DateToAge.h"

@implementation NSString (DateToAge)

+ (NSString *)dateToAgeWithDateStr:(NSString *)dateStr {
    //生日
    NSDate *bornDate = [NSDate dateWithDateStr:dateStr formatter:@"yyyy-MM-dd"];
    //获得当前系统时间
    NSDate *currentDate = [NSDate date];
    //获得当前系统时间与出生日期之间的时间间隔
    NSTimeInterval time = [currentDate timeIntervalSinceDate:bornDate];
    //时间间隔以秒作为单位,求年的话除以60*60*24*365
    NSInteger age = ((NSInteger)time)/(3600*24*365);
    return [NSString stringWithFormat:@"%ld岁",age];
}

@end
