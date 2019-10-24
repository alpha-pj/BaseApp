//
//  NSArray+SafeIndex.m
//  Lovers
//
//  Created by PeiJun on 2017/6/3.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import "NSArray+SafeIndex.h"

@implementation NSArray (SafeIndex)

- (id)safeObjectAtIndex:(NSInteger)index {
    if (index < 0)
        return nil;
    
    if (index >= self.count)
        return nil;
    
    return [self objectAtIndex:index];
}

@end
