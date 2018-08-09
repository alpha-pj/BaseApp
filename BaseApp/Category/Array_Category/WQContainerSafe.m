//
//  NSMutableDictionary+L1.m
//  Game
//
//  Created by December on 15/12/16.
//  Copyright © 2015年 anzogame. All rights reserved.
//

/*
    防止字典、数组设置空值，防止数组越界。
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@implementation NSMutableDictionary (L1)
+(void)load
{
    [self swizze];
}
+(void)swizze
{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method new = class_getInstanceMethod(self, @selector(setSaveObject:forKey:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}
-(void)setSaveObject:(id)value forKey:(id)key
{
    if (value!=nil) {
        [self setSaveObject:value forKey:key];
    }else{
        NSAssert(NO, @"字典value 为空");
    }
}
@end

@implementation NSArray (L1)

+(void)load
{
    [self swizzeObjectRange0];
    [self swizzeObjectRangeI];
    [self swizzeObjectRangeM];
    [self swizzeInstert];
}
+(void)swizzeObjectRange0
{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArray0"), @selector(objectAtIndex:));
    Method new = class_getInstanceMethod(self, @selector(objectAtSafeIndex0:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}
+(void)swizzeObjectRangeI
{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method new = class_getInstanceMethod(self, @selector(objectAtSafeIndexI:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}
+(void)swizzeObjectRangeM
{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
    Method new = class_getInstanceMethod(self, @selector(objectAtSafeIndexM:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}
-(id)objectAtSafeIndex0:(NSUInteger)index
{
    NSAssert(NO, @"数组为空0");
    return nil;
}
-(id)objectAtSafeIndexI:(NSUInteger)index
{
    if (index<self.count) {
        return [self objectAtSafeIndexI:index];
    }
    NSAssert(NO, @"数组为空I");
    return nil;
}
-(id)objectAtSafeIndexM:(NSUInteger)index
{
    if (index<self.count) {
        return [self objectAtSafeIndexM:index];
    }
    NSAssert(NO, @"数组为空M");
    return nil;
}
#pragma mark - instert
+(void)swizzeInstert
{
    Method old = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
    Method new = class_getInstanceMethod(self, @selector(insertSaveObject:atIndex:));
    if (!old || !new) {
        return;
    }
    method_exchangeImplementations(old, new);
}

-(void)insertSaveObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject!=nil) {
        [self insertSaveObject:anObject atIndex:index];
    } else {
        NSAssert(NO, @"添加的元素为空");
    }
}
@end
