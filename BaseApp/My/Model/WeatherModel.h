//
//  WeatherModel.h
//  BaseApp
//
//  Created by PeiJun on 2019/3/21.
//  Copyright © 2019 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastItem : NSObject
@property (nonatomic , copy) NSString              * fengli;
@property (nonatomic , copy) NSString              * low;
@property (nonatomic , copy) NSString              * high;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * fengxiang;
@property (nonatomic , copy) NSString              * date;

@end


@interface Yesterday : NSObject
@property (nonatomic , copy) NSString              * low;
@property (nonatomic , copy) NSString              * high;
@property (nonatomic , copy) NSString              * fl;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * fx;
@property (nonatomic , copy) NSString              * date;

@end


@interface WeatherModel : NSObject

@property (nonatomic , strong) NSMutableArray <ForecastItem *>              * forecast;
@property (nonatomic , copy) NSString              * wendu;
@property (nonatomic , strong) Yesterday              * yesterday;
@property (nonatomic , copy) NSString              * city;
@property (nonatomic , copy) NSString              * ganmao;

@end

