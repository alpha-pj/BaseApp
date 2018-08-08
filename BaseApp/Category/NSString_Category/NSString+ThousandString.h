//
//  NSString+ThousandString.h
//  TimeDiary
//
//  Created by PeiJun on 2017/3/29.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ThousandString)


/**
 数字过万处理

 @param number NSNumber类型数
 @return 返回过万字符串
 */
+ (NSString *)getTenThousandStringWithNumber:(NSNumber *)number;

@end
