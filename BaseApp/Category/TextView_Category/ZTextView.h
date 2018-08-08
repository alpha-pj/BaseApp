//
//  ZTextView.h
//  KoreanFans
//
//  Created by PeiJun on 2016/12/7.
//  Copyright © 2016年 PeiJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTextView : UITextView

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UILabel *placeholderLb;

@property (nonatomic, copy) void (^textChangedBlock)(ZTextView *textView);

@end
