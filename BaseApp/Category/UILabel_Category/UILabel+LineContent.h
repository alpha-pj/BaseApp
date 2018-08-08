//
//  UILabel+LineContent.h
//  KoreanFans
//
//  Created by PeiJun on 2016/11/3.
//  Copyright © 2016年 PeiJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LineContent)

//算出label每行的内容
- (NSArray *)getLinesArrayOfStringWith:(CGFloat)lbWidth;

@end
