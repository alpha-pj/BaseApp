//
//  NSString+IDFV.m
//  Lovers
//
//  Created by PeiJun on 2017/10/17.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import "NSString+IDFV.h"
#import "KeychainWrapper.h"

#define uniqueIDFV @"uniqueDeviceIdentifier"

//需要去KeychainWrapper.m修改kKeychainItemIdentifier

@implementation NSString (IDFV)

+ (NSString *)getUniqueDeviceIdentifierAsString {
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    NSString *strAppIDFV = [userDf objectForKey:uniqueIDFV];
    if ([NSString isBlankString:strAppIDFV]) {
        KeychainWrapper *wrapper = [[KeychainWrapper alloc]init];
        strAppIDFV = [wrapper myObjectForKey:(id)kSecAttrAccount];
        if ([NSString isBlankString:strAppIDFV]) {
            strAppIDFV = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            [wrapper mySetObject:strAppIDFV forKey:(id)kSecAttrAccount];
        }
        [userDf setObject:strAppIDFV forKey:uniqueIDFV];
    }
    return strAppIDFV;
}

@end
