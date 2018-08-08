//
//  NSString+DateToAge.h
//  TimeDiary
//
//  Created by PeiJun on 2018/3/29.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateToAge)

//根据生日获取年龄
+ (NSString *)dateToAgeWithDateStr:(NSString *)dateStr;

@end
