//
//  NSMutableArray+SafeAdd.h
//  TimeDiary
//
//  Created by PeiJun on 2017/7/24.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SafeAdd)


/**
 防止可变数组添加空值

 @param object 需要添加到数组的值
 */
- (void)safeAddObject:(id)object;

@end
