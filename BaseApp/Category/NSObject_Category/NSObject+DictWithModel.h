//
//  NSObject+DictWithModel.h
//  Lovers
//
//  Created by PeiJun on 2019/6/6.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictWithModel)

//model转字典(一对一)
- (NSDictionary *)dictionaryRepresentation;

@end
