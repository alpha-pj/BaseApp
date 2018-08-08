//
//  NSObject+DictWithModel.h
//  TimeDiary
//
//  Created by PeiJun on 2018/4/8.
//  Copyright © 2018年 brt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictWithModel)

//model转字典(一对一)
- (NSDictionary *)dictionaryRepresentation;

@end
