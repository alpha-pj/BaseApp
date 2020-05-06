//
//  BaseNetWork.m
//  BaseApp
//
//  Created by PeiJun on 2018/4/24.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import "BaseNetWork.h"
#import <AFNetworking/AFNetworking.h>

@implementation BaseNetWork

+ (AFHTTPSessionManager *)shareAFNManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [AFHTTPSessionManager manager];
        manager.operationQueue.maxConcurrentOperationCount = 5;
        manager.requestSerializer.timeoutInterval = 10.f;
        manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
        [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
        
    });
    return manager;
}

#pragma mark 处理get请求
+ (NSURLSessionDataTask *)doGetRequestWithUrl:(NSString *)url
                                   parameters:(NSDictionary *)parameters
                                     progress:(void (^)(NSProgress *downloadProgress))progress
                                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    //AFN管理者调用get请求方法
    NSURLSessionDataTask *task = [[BaseNetWork shareAFNManager] GET:url parameters:parameters headers:nil progress:^(NSProgress *downloadProgress) {
        //返回请求返回进度
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        //请求成功返回数据 根据responseSerializer 返回不同的数据格式
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //请求失败
        if (failure) {
            failure(task, error);
        }
    }];
    return task;
}
#pragma mark 处理post请求
+ (NSURLSessionDataTask *)doPostRequestWithUrl:(NSString *)url
                                    parameters:(NSDictionary *)parameters
                                      progress:(void (^)(NSProgress *downloadProgress))progress
                                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    //AFN管理者调用post请求方法
    NSURLSessionDataTask *task = [[BaseNetWork shareAFNManager] POST:url parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //返回请求返回进度
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        //请求成功返回数据 根据responseSerializer 返回不同的数据格式
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //请求失败
        if (failure) {
            failure(task, error);
        }
    }];
    return task;
}

#pragma mark 处理文件下载
+ (void)downLoadFileWithUrl:(NSString *)url
                   savePath:(NSString *)savePath
                   progress:(void (^)(CGFloat value))progress
                   complete:(void (^)(NSURL *filePath, NSError *error))complete {
    AFHTTPSessionManager *manager = [BaseNetWork shareAFNManager];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress.fractionCompleted);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *url = [[NSURL alloc] initFileURLWithPath:savePath];
        //返回要保存文件的路径
        return url;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (complete) {
            complete(filePath, error);
        }
    }] resume];
}

#pragma mark 网络状态监听
+ (void)aFNetworkStatus {
    //创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [BaseMBProgressHud showMBHudWithText:@"未知网络"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [BaseMBProgressHud showMBHudWithText:@"无网络"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [BaseMBProgressHud showMBHudWithText:@"蜂窝数据网络"];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [BaseMBProgressHud showMBHudWithText:@"WiFi网络"];
                break;
                
            default:
                break;
        }
    }] ;
    
    [manager startMonitoring];
}

@end
