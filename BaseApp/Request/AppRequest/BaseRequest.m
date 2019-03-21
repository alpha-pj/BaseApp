//
//  BaseRequest.m
//  BaseApp
//
//  Created by PeiJun on 2018/8/9.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

//根据城市获取天气信息
+ (NSURLSessionDataTask *)getWeatherWithCity:(NSString *)city
                                             progress:(void (^)(NSProgress *downloadProgress))progress
                                              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSString *url = @"http://wthrcdn.etouch.cn/weather_mini?";
    NSDictionary *par = [NSDictionary dictionaryWithObjectsAndKeys:city,@"city", nil];
    NSURLSessionDataTask *task = [BaseNetWork doGetRequestWithUrl:url parameters:par progress:^(NSProgress *downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);
        }
    }];
    return task;
}


@end
