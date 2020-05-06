//
//  NSString+Random.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (NSString *)getRandomNum;

+ (NSString *)getRandomName;

+ (NSString *)getRandomNameWithTotalCount:(NSInteger)count;

+ (NSString *)getLowerCaseRandomNameWithTotalCount:(NSInteger)count;

+ (NSString *)getRandomImageName;

@end
