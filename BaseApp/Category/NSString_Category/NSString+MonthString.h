//
//  NSString+MonthString.h
//  TimeDiary
//
//  Created by PeiJun on 2017/9/18.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MonthString)


/**
 月份转换

 @param numString 需要转换的字符串
 @return 转换后的多少月
 */
+ (NSString *)monthStringWithString:(NSString *)numString;

@end
