//
//  NSString+IsPhoneNumber.m
//  Lovers
//
//  Created by PeiJun on 2017/4/24.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import "NSString+IsPhoneNumber.h"

@implementation NSString (IsPhoneNumber)

- (BOOL)isPhoneNumber
{
    //因为现有的号码不能满足市场需求，电信服务商会增大号码范围。所以一般情况下我们只要验证手机号码为11位，且以1开头
    NSString *NORMAL_NUM = @"^1[0-9]{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NORMAL_NUM];
    BOOL isMatch = [pred evaluateWithObject:self];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
}

@end
