//
//  BaseNetWork.h
//  BaseApp
//
//  Created by PeiJun on 2018/4/24.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetWork : NSObject

/**
 处理post请求
 
 @param url 地址
 @param parameters 参数
 @param progress 进度
 @param success 成功回调
 @param failure 失败回调
 @return 请求
 */
+ (NSURLSessionDataTask *)doPostRequestWithUrl:(NSString *)url
                                    parameters:(NSDictionary *)parameters
                                      progress:(void (^)(NSProgress *downloadProgress))progress
                                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 处理get请求
 
 @param url 地址
 @param parameters 参数
 @param progress 进度
 @param success 成功回调
 @param failure 失败回调
 @return 请求
 */
+ (NSURLSessionDataTask *)doGetRequestWithUrl:(NSString *)url
                                   parameters:(NSDictionary *)parameters
                                     progress:(void (^)(NSProgress *downloadProgress))progress
                                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 网络状态监听
 */
+ (void)aFNetworkStatus;

@end
