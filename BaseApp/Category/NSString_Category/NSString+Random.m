//
//  NSString+Random.m
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "NSString+Random.h"
#import "NSString+NowTimeInterval.h"
@implementation NSString (Random)

+ (NSString *)getRandomNum
{
    int num = (arc4random() % 1000000);
    NSString *randomNumber = [NSString stringWithFormat:@"%.6d",num];
    return randomNumber;
}

+ (NSString *)getRandomName
{
    int count = arc4random() % 4 + 8;
    NSString *source = @"1a23bcdefgh5ijklmn46opqr8stuvw79xyz";
    NSMutableString *str = [NSMutableString string];
    for (int i = 0; i < count; i++)
    {
        NSInteger loc = arc4random() % 35;
        NSString *sub = [source substringWithRange:NSMakeRange(loc, 1)];
        [str appendString:sub];
    }
    return str;
}


+ (NSString *)getRandomNameWithTotalCount:(int)count
{
    NSString *source = @"1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *str = [NSMutableString string];
    for (int i = 0; i < count; i++)
    {
        NSInteger loc = arc4random() % 61;
        NSString *sub = [source substringWithRange:NSMakeRange(loc, 1)];
        [str appendString:sub];
    }
    return str;
}

+ (NSString *)getRandomImageName
{
   return  [NSString stringWithFormat:@"%@_%@",[NSString nwTimeGet], [NSString getRandomNameWithTotalCount:16]];
}

@end
