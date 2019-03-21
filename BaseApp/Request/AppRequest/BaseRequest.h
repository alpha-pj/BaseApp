//
//  BaseRequest.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/9.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequest : NSObject

/**
 根据城市获取天气信息
 
 @param city 城市名
 */
+ (NSURLSessionDataTask *)getWeatherWithCity:(NSString *)city
                                    progress:(void (^)(NSProgress *downloadProgress))progress
                                     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
