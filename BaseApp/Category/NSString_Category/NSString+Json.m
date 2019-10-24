//
//  NSString+Json.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "NSString+Json.h"

@implementation NSString (Json)

+ (NSString *)JsonToStringWithDic:(NSDictionary *)json {
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:json options:0 error:nil];
    NSString * contentStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return contentStr;
}

/**
 *  将字符串转成数组
 */
+ (NSArray *)stringToJSON:(NSString *)jsonStr {
    if (jsonStr) {
        id tmp = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
        if (tmp) {
            if ([tmp isKindOfClass:[NSArray class]]) {
                return tmp;
            } else if([tmp isKindOfClass:[NSString class]] || [tmp isKindOfClass:[NSDictionary class]]) {
                return [NSArray arrayWithObject:tmp];
            } else {
                return nil;
            }
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}

@end
