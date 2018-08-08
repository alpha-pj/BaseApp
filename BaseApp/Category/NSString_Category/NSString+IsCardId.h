//
//  NSString+IsCardId.h
//  TimeDiary
//
//  Created by PeiJun on 2018/6/27.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IsCardId)

//是否是身份证号
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;

@end
