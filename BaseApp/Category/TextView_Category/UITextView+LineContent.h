//
//  UITextView+LineContent.h
//  Lovers
//
//  Created by PeiJun on 2017/9/18.
//  Copyright © 2017年 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LineContent)

//算出textView每行的内容
- (NSArray *)getLinesArrayOfStringWith:(CGFloat)tvWidth;

@end
