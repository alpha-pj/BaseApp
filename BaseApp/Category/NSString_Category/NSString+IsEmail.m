//
//  NSString+IsEmail.m
//  TimeDiary
//
//  Created by PeiJun on 2018/3/26.
//  Copyright © 2018年 brt. All rights reserved.
//

#import "NSString+IsEmail.h"

@implementation NSString (IsEmail)

- (BOOL)isEmail {
    if ([NSString isBlankString:self]) {
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
