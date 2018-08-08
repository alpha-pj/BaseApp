//
//  NSString+IsPhoneNumber.h
//  TimeDiary
//
//  Created by PeiJun on 2017/4/24.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IsPhoneNumber)


/**
 验证是否是手机号码

 @return 是否是手机号
 */
- (BOOL)isPhoneNumber;

@end
