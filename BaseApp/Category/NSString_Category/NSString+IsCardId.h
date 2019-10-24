//
//  NSString+IsCardId.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IsCardId)

//是否是身份证号
+ (BOOL)judgeIdentityStringValid:(NSString *)identityString;

@end
