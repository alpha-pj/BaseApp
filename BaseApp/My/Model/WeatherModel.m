//
//  WeatherModel.m
//  BaseApp
//
//  Created by PeiJun on 2019/3/21.
//  Copyright © 2019 PeiJun. All rights reserved.
//

#import "WeatherModel.h"

@implementation ForecastItem

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end


@implementation Yesterday

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end


@implementation WeatherModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _forecast = [NSMutableArray array];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"forecast"]) {
        if ([value isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dict in value) {
                if ([dict isKindOfClass:[NSDictionary class]]) {
                    ForecastItem *item = [[ForecastItem alloc] init];
                    [item setValuesForKeysWithDictionary:dict];
                    [_forecast addObject:item];
                }
            }
        }
    } else {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
