//
//  NSString+Random.h
//  BaseApp
//
//  Created by PeiJun on 2018/8/8.
//  Copyright © 2018年 PeiJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (NSString *)getRandomNum;

+ (NSString *)getRandomName;

+ (NSString *)getRandomNameWithTotalCount:(int)count;

+ (NSString *)getRandomImageName;

@end
