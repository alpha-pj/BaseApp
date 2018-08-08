//
//  NSObject+DictWithModel.m
//  TimeDiary
//
//  Created by PeiJun on 2018/4/8.
//  Copyright © 2018年 brt. All rights reserved.
//

#import "NSObject+DictWithModel.h"
#import <objc/runtime.h>

@implementation NSObject (DictWithModel)

//model转字典
- (NSDictionary *)dictionaryRepresentation {
    unsigned int count = 0;
    //获取属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:count];
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [self valueForKey:key];
        if (key && value) {
            [dict setObject:value forKey:key];
        }
    }
    free(properties);
    return dict;
}

@end
