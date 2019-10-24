//
//  NSString+Json.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Json)

+ (NSString *)JsonToStringWithDic:(NSDictionary *)json;
+ (NSArray *)stringToJSON:(NSString *)jsonStr;

@end
