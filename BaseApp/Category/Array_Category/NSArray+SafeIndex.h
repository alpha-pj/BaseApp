//
//  NSArray+SafeIndex.h
//  TimeDiary
//
//  Created by PeiJun on 2017/6/3.
//  Copyright © 2017年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SafeIndex)


/**
 防止数组越界崩溃

 @param index 数组下标
 @return 安全返回
 */
- (id)safeObjectAtIndex:(NSInteger)index;

@end
