//
//  NSString+DateToAge.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateToAge)

//根据生日获取年龄
+ (NSString *)dateToAgeWithDateStr:(NSString *)dateStr;

@end
