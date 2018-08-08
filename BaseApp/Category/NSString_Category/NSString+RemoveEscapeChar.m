//
//  NSString+RemoveEscapeChar.m
//  TimeDiary
//
//  Created by PeiJun on 2017/3/31.
//  Copyright © 2017年 brt. All rights reserved.
//

#import "NSString+RemoveEscapeChar.h"

@implementation NSString (RemoveEscapeChar)

+ (NSString *)z_stringRemoveTheEscapeCharacter:(NSString *)curString {
    curString = [curString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    curString = [curString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    curString = [curString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    curString = [curString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return curString;
}

@end
