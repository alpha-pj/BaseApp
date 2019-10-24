//
//  NSMutableArray+SafeAdd.m
//  Lovers
//
//  Created by PeiJun on 2017/7/24.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import "NSMutableArray+SafeAdd.h"

@implementation NSMutableArray (SafeAdd)

- (void)safeAddObject:(id)object {
    if (!object || [object isKindOfClass:[NSNull class]]) {
        return;
    } else {
        [self addObject:object];
    }
}

@end
