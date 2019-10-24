//
//  DatePickerView.h
//  Lovers
//
//  Created by PeiJun on 2019/6/17.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DatePickerTopType) {
    DatePickerTopTypeTitleLabel, //顶部带label的样式
    DatePickerTopTypeSegment     //顶部带Segment的样式
};

/**
 确定回调

 @param date 选中的日期
 */

/**
 确定回调

 @param date 阳历日期
 @param isLunar 是否是农历
 */

/**
 确定回调

 @param date 阳历日期
 @param lunarDate 农历日期
 @param isLunar 是否是农历
 */
typedef void(^sureBlock)(NSString *date, NSString *lunarDate, BOOL isLunar);

@interface DatePickerView : UIView

@property(nonatomic, assign) BOOL isLunar;        //是否为农历模式(需在currentDate之前设置)
@property(nonatomic, strong) NSDate *currentDate;     //设置当前时间
@property (nonatomic, assign) DatePickerTopType topType;  //默认DatePickerTopTypeSegment
@property (nonatomic, copy) sureBlock sureBlock;

//让父类初始化不可用
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
//自定义初始化函数
- (instancetype)initWithCurrentDate:(NSDate *)currentDate isLunar:(BOOL)isLunar NS_DESIGNATED_INITIALIZER;

/**
  隐藏
 */
- (void)hideDateTimePickerView;
/**
  显示
 */
- (void)showDateTimePickerView;
/**
 阳历转农历
 
 @param date 阳历日期
 @return 返回的农历字符串（例：2003年 正月 廿五）
 */
+ (NSString *)getChineseCalendarWithDate:(NSDate *)date;

@end

