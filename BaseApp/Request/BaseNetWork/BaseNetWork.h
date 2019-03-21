//
//  BaseNetWork.h
//  BaseApp
//
//  Created by PeiJun on 2018/4/24.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetWork : NSObject

#pragma mark 处理get请求
+ (NSURLSessionDataTask *)doGetRequestWithUrl:(NSString *)url
                                   parameters:(NSDictionary *)parameters
                                     progress:(void (^)(NSProgress *downloadProgress))progress
                                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
#pragma mark 处理post请求
+ (NSURLSessionDataTask *)doPostRequestWithUrl:(NSString *)url
                                    parameters:(NSDictionary *)parameters
                                      progress:(void (^)(NSProgress *downloadProgress))progress
                                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
