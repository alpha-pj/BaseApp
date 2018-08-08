//
//  NSString+Json.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Json)

+ (NSString *)JsonToStringWithDic:(NSDictionary *)json;
+ (NSArray *)stringToJSON:(NSString *)jsonStr;

@end
