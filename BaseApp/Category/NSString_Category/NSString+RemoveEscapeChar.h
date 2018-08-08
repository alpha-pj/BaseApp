//
//  NSString+RemoveEscapeChar.h
//  TimeDiary
//
//  Created by PeiJun on 2017/3/31.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RemoveEscapeChar)


/**
 去除转义字符(一般用于处理网址)

 @param curString 需要处理的字符串
 @return 处理后的字符串
 */
+ (NSString *)z_stringRemoveTheEscapeCharacter:(NSString *)curString;

@end
