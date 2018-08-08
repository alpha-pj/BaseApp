//
//  NSString+IDFV.m
//  TimeDiary
//
//  Created by PeiJun on 2017/10/17.
//  Copyright © 2017年 brt. All rights reserved.
//

#import "NSString+IDFV.h"
#import "SAMKeychain.h"
#import "SAMKeychainQuery.h"

@implementation NSString (IDFV)

/**
 为保证用户在删除应用时，取到的 IDFV 仍和之前的一样，可以借助 Keychain。使用 SAMKeychain，可以很方便地设置 keychain。 需要注意的是， keychain 在同一个苹果账号的不同设备下是同步的，需要设置query.synchronizationMode = SAMKeychainQuerySynchronizationModeNo;，不在设备间同步这个值，这样不同设备获取到的便是不同的 ID

 @return IDFV
 */
+ (NSString *)getUniqueDeviceIdentifierAsString {
    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    NSString *strApplicationUUID =  [SAMKeychain passwordForService:appName account:@"incoding"];
    
    if (strApplicationUUID == nil) {
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSError *error = nil;
        SAMKeychainQuery *query = [[SAMKeychainQuery alloc] init];
        query.service = appName;
        query.account = @"incoding";
        query.password = strApplicationUUID;
        query.synchronizationMode = SAMKeychainQuerySynchronizationModeNo;
        [query save:&error];
    }
    
    return strApplicationUUID;
}

@end
