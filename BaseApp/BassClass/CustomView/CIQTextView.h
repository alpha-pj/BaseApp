//
//  CIQTextView.h
//  Lovers
//
//  Created by PeiJun on 2016/12/7.
//  Copyright © 2016年 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 支持placeholder的UITextView
 */
@interface CIQTextView : UITextView  //Copy from IQTextView

@property(nullable, nonatomic,copy) IBInspectable NSString *placeholder;

@property(nullable, nonatomic,copy) IBInspectable NSAttributedString *attributedPlaceholder;

@property(nullable, nonatomic,copy) IBInspectable UIColor *placeholderTextColor;

@end
