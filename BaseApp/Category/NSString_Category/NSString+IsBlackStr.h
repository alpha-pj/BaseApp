//
//  NSString+IsBlackStr.h
//  TimeDiary
//
//  Created by PeiJun on 2017/9/12.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IsBlackStr)

//字符串是否为空(包含@"")
+ (BOOL)isBlankString:(id)string;
//不为空的字符串
+ (BOOL)isString:(id)string;
//防止NSString被当作NSNumber等误调stringValue
- (NSString *)stringValue;

@end
