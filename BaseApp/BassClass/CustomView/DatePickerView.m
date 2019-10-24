//
//  DatePickerView.m
//  Lovers
//
//  Created by PeiJun on 2019/6/17.
//  Copyright © 2019 LeMeng. All rights reserved.
//

#import "DatePickerView.h"
#import "ZSegmentedView.h"

#define ContVHeight 280
#define TopToolHeight 50
#define LRSpace 26
#define JiaZiYear 2697  //农历以公元前2697年为第一个甲子年，60年一个周期

@interface DatePickerView() <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSInteger yearRange;
    NSInteger dayRange;
    
    NSInteger startYear;
    
    NSInteger selectedEra;
    NSInteger selectedYear;
    NSInteger selectedMonth;
    NSInteger selectedDay;
    
    NSInteger selYearLeapMonth;  //选择的年份的闰月
    //左边退出按钮
    UIButton *cancelButton;
    //右边的确定按钮
    UIButton *chooseButton;
}

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *contentV;

@property (nonatomic, strong) NSArray *chineseMonths;
@property (nonatomic, strong) NSArray *chineseDays;
@property (nonatomic, strong) NSDictionary *leapDic;
@property (nonatomic, strong) ZSegmentedView *typeSegmentedView;

@property (nonatomic, copy) NSString *title;
@property(nonatomic, strong) UILabel *titleL;        //中心标题

@property (nonatomic,strong) NSString *dateString;  //阳历日期
@property (nonatomic,strong) NSString *lunarDateString; //农历日期

@end

@implementation DatePickerView

- (instancetype)initWithCurrentDate:(NSDate *)currentDate isLunar:(BOOL)isLunar {
    if (self = [super initWithFrame:CGRectZero]) {
        [self setViewStatus];
        //子视图初始化后赋值
        self.isLunar = isLunar;
        if (currentDate) {
            self.currentDate = currentDate;
        }
    }
    return self;
}

- (void)setTopType:(DatePickerTopType)topType {
    _topType = topType;
    switch (_topType) {
        case DatePickerTopTypeTitleLabel:
        {
            self.titleL.hidden = NO;
            self.typeSegmentedView.hidden = YES;
        }
            break;
        case DatePickerTopTypeSegment:
        {
            self.titleL.hidden = YES;
            self.typeSegmentedView.hidden = NO;
        }
        default:
            break;
    }
}

- (void)setIsLunar:(BOOL)isLunar {
    _isLunar = isLunar;
    if (_isLunar) {
        self.typeSegmentedView.selectedSegmentIndex = 1;
    } else {
        self.typeSegmentedView.selectedSegmentIndex = 0;
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleL.text = _title;
}
- (void)setCurrentDate:(NSDate *)currentDate {
    _currentDate = currentDate;
    //根据日历获取时间信息
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *comps = [calendar0 components:unitFlags fromDate:currentDate];
    if (_isLunar) {
        NSCalendar *chineseCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
        comps = [chineseCalendar components:unitFlags fromDate:currentDate];
    }
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    selectedEra = [comps era];
    if (_isLunar) {
        //农历以公元前2697年为第一个甲子年，60年一个周期
        year = - JiaZiYear + comps.era * 60 + comps.year;
    }
    selectedYear = year;
    selectedMonth = month;
    selectedDay = day;
    
    [self.pickerView selectRow:year - startYear inComponent:0 animated:NO];
    [self pickerView:self.pickerView didSelectRow:year - startYear inComponent:0];
    if (comps.leapMonth) {
        [self.pickerView selectRow:month inComponent:1 animated:NO];
        [self pickerView:self.pickerView didSelectRow:month inComponent:1];
    } else {
        [self.pickerView selectRow:month - 1 inComponent:1 animated:NO];
        [self pickerView:self.pickerView didSelectRow:month - 1 inComponent:1];
    }
    [self.pickerView selectRow:day - 1 inComponent:2 animated:NO];
    [self pickerView:self.pickerView didSelectRow:day - 1 inComponent:2];
    
    [self.pickerView reloadAllComponents];
}

- (void)typeSegmentedIndex:(NSInteger)index {
    NSInteger year = selectedYear;
    NSInteger month = selectedMonth;
    NSInteger day = selectedDay;
    NSInteger leapMonth = selYearLeapMonth;
    
    NSDateComponents* components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = nil;
    if (_isLunar) {
        //农历
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
        [components setCalendar:calendar];
        [components setEra:(year + JiaZiYear) / 60];
        [components setYear:(year + JiaZiYear) % 60];
        if (leapMonth >= month || !leapMonth) {
            [components setMonth:month];
            [components setLeapMonth:NO];
        } else if (leapMonth == month - 1) {
            [components setMonth:month - 1];
            [components setLeapMonth:YES];
        } else {
            [components setMonth:month - 1];
            [components setLeapMonth:NO];
        }
        [components setDay:day];
    } else {
        //阳历
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        [components setCalendar:calendar];
        [components setYear:year];
        [components setMonth:month];
        [components setDay:day];
    }
    NSDate *date = [calendar dateFromComponents:components];
    
    
    _isLunar = index;
    [self setCurrentDate:date];
    [self.pickerView reloadAllComponents];
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

//确定每一列返回的东西
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            return yearRange;
        }
            break;
        case 1:
        {
            NSInteger months = [self getMonthsWithYear:selectedYear isLunar:_isLunar];
            return months;
        }
            break;
        case 2:
        {
            return dayRange;
        }
            break;
            
        default:
            return 0;
            break;
    }
}

#pragma mark -- UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 34;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] init];
    label.font = AppFontNormal(23);
    label.textColor = ColorHexString(@"#000000");
    label.tag = component * 100 + row;
    label.textAlignment = NSTextAlignmentCenter;
    switch (component) {
        case 0:
        {
            NSInteger year = startYear + row;
            label.text = [NSString stringWithFormat:@"%ld年", year];
        }
            break;
        case 1:
        {
            NSInteger month = row + 1;
            if (_isLunar) {
                label.text = [self getChinsesMonthStringWithMonth:month leapMonth:selYearLeapMonth];
            } else {
                label.text = [NSString stringWithFormat:@"%ld月", month];
            }
        }
            break;
        case 2:
        {
            NSInteger day = row + 1;
            if (_isLunar) {
                label.text = [self.chineseDays safeObjectAtIndex:day - 1];
            } else {
                label.text = [NSString stringWithFormat:@"%ld日", day];
            }
        }
            break;
            
        default:
            break;
    }
    return label;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return ((ScreenWidth - 2 * LRSpace) * 0.8)/3;
}

//picker滑动
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
        {
            selectedYear = startYear + row;
            selYearLeapMonth = [self getLeapMonthWithChineseYear:selectedYear];
            [self.pickerView reloadComponent:1];
            dayRange = [DatePickerView getDaysWithYear:selectedYear month:selectedMonth leapMonth:selYearLeapMonth isLunar:_isLunar];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 1:
        {
            selectedMonth = row + 1;
            dayRange = [DatePickerView getDaysWithYear:selectedYear month:selectedMonth leapMonth:selYearLeapMonth isLunar:_isLunar];
            [self.pickerView reloadComponent:2];
        }
            break;
        case 2:
        {
            selectedDay = row + 1;
        }
            break;
            
        default:
            break;
    }
    if (_isLunar) {
        //农历模式下
        //阳历日期
        NSInteger year = selectedYear;
        NSInteger month = selectedMonth;
        NSInteger day = selectedDay;
        NSInteger leapMonth = selYearLeapMonth;
        
        NSDateComponents* components = [[NSDateComponents alloc] init];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
        [components setCalendar:calendar];
        [components setEra:(year + JiaZiYear) / 60];
        [components setYear:(year + JiaZiYear) % 60];
        if (leapMonth >= month || !leapMonth) {
            [components setMonth:month];
            [components setLeapMonth:NO];
        } else if (leapMonth == month - 1) {
            [components setMonth:month - 1];
            [components setLeapMonth:YES];
        } else {
            [components setMonth:month - 1];
            [components setLeapMonth:NO];
        }
        [components setDay:day];
        NSDate *date = [calendar dateFromComponents:components];
        _dateString = [NSString getTimeStrWithDate:date format:@"yyyy-MM-dd"];
        //农历日期
        NSString *chineseMonth = [self getChinsesMonthStringWithMonth:selectedMonth leapMonth:selYearLeapMonth];
        NSString *chineseDay = [self.chineseDays safeObjectAtIndex:selectedDay - 1];
        _lunarDateString = [NSString stringWithFormat:@"%ld年 %@ %@", selectedYear, chineseMonth, chineseDay];
        self.titleL.text = _lunarDateString;
    } else {
        //阳历模式下
        //阳历日期
        _dateString = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld",selectedYear,selectedMonth,selectedDay];
        //农历日期
        _lunarDateString = [DatePickerView getChineseCalendarWithDate:[NSDate dateWithDateStr:_dateString formatter:@"yyyy-MM-dd"]];
        self.titleL.text = _dateString;
    }
}

#pragma mark -- show and hidden
- (void)showDateTimePickerView{
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 1;
        _contentV.frame = CGRectMake(0, ScreenHeight - ContVHeight, ScreenWidth, ContVHeight);
    }];
}
- (void)hideDateTimePickerView{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
        _contentV.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ContVHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//取消的隐藏
- (void)cancelButtonClick {
    [self hideDateTimePickerView];
    
}

//确认的隐藏
-(void)configButtonClick {
    if (self.sureBlock) {
        self.sureBlock(_dateString, _lunarDateString, _isLunar);
    }
    [self hideDateTimePickerView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.contentV] && ![self.contentV.subviews containsObject:touch.view]) {
        [self cancelButtonClick];
    }
}

/**
 获取某年中某个月的天数
 
 @param year    年
 @param month   月
 @param leapMonth   当前年的闰月(0表示无闰月)
 @param isLunar 查找的日历是否是农历
 */
+ (NSInteger)getDaysWithYear:(NSInteger)year month:(NSInteger)month leapMonth:(NSInteger)leapMonth isLunar:(BOOL)isLunar {
    NSDateComponents* components = [[NSDateComponents alloc] init];
    NSCalendar *calendar = nil;
    if (isLunar) {
        //农历
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
        [components setCalendar:calendar];
        [components setEra:(year + JiaZiYear) / 60];
        [components setYear:(year + JiaZiYear) % 60];
        if (leapMonth >= month || !leapMonth) {
            [components setMonth:month];
            [components setLeapMonth:NO];
        } else if (leapMonth == month - 1) {
            [components setMonth:month - 1];
            [components setLeapMonth:YES];
        } else {
            [components setMonth:month - 1];
            [components setLeapMonth:NO];
        }
        [components setDay:1];
    } else {
        //阳历
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        [components setCalendar:calendar];
        [components setYear:year];
        [components setMonth:month];
        [components setDay:1];
    }
    NSDate* theMonthFirstDate = [calendar dateFromComponents:components];
    NSDate* nextMonthFirstDay = [calendar dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:theMonthFirstDate options:NSCalendarMatchStrictly];
    NSDateComponents* c = [calendar components:NSCalendarUnitDay fromDate:theMonthFirstDate toDate:nextMonthFirstDay options:NSCalendarMatchStrictly];
    return c.day;
}
/**
 获取某年的月数
 
 @param year    年
 @param isLunar 查找的日历是否是农历
 */
- (NSInteger)getMonthsWithYear:(NSInteger)year isLunar:(BOOL)isLunar {
    if (isLunar) {
        NSString *month = [self.leapDic objectForKey:[NSString stringWithFormat:@"%ld", (long)year]];
        if ([NSString isString:month]) {
            return 13;
        } else {
            return 12;
        }
    } else {
        return 12;
    }
}
/**
 获取某农历年的闰月月份(0表示无闰月)
 
 @param year 农历年
 */
- (NSInteger)getLeapMonthWithChineseYear:(NSInteger)year {
    NSString *month = [self.leapDic objectForKey:[NSString stringWithFormat:@"%ld", (long)year]];
    return month.integerValue;
}

- (NSString *)getChinsesMonthStringWithMonth:(NSInteger)month leapMonth:(NSInteger)leapMonth {
    NSString *m_str = nil;
    if (leapMonth >= month || !leapMonth) {
        m_str = [self.chineseMonths safeObjectAtIndex:month - 1];
    } else if (leapMonth == month - 1) {
        m_str = [@"闰" stringByAppendingString:[self.chineseMonths safeObjectAtIndex:month - 2]];
    } else {
        m_str = [self.chineseMonths safeObjectAtIndex:month - 2];
    }
    return m_str;
}

- (void)setViewStatus {
    //闰月范围1900---2100
    self.leapDic = @{@"1900":@"8",
                     @"1903":@"5",
                     @"1906":@"4",
                     @"1909":@"2",
                     @"1911":@"6",
                     @"1914":@"5",
                     @"1917":@"2",
                     @"1919":@"7",
                     @"1922":@"5",
                     @"1925":@"4",
                     @"1928":@"2",
                     @"1930":@"6",
                     @"1933":@"5",
                     @"1936":@"3",
                     @"1938":@"7",
                     @"1941":@"6",
                     @"1944":@"4",
                     @"1947":@"2",
                     @"1949":@"7",
                     @"1952":@"5",
                     @"1955":@"3",
                     @"1957":@"8",
                     @"1960":@"6",
                     @"1963":@"4",
                     @"1966":@"3",
                     @"1968":@"7",
                     @"1971":@"5",
                     @"1974":@"4",
                     @"1976":@"8",
                     @"1979":@"6",
                     @"1982":@"4",
                     @"1984":@"10",
                     @"1987":@"6",
                     @"1990":@"5",
                     @"1993":@"3",
                     @"1995":@"8",
                     @"1998":@"5",
                     @"2001":@"4",
                     @"2004":@"2",
                     @"2006":@"7",
                     @"2009":@"5",
                     @"2012":@"4",
                     @"2014":@"9",
                     @"2017":@"6",
                     @"2020":@"4",
                     @"2023":@"2",
                     @"2025":@"6",
                     @"2028":@"5",
                     @"2031":@"3",
                     @"2033":@"11",
                     @"2036":@"6",
                     @"2039":@"5",
                     @"2042":@"2",
                     @"2044":@"7",
                     @"2047":@"5",
                     @"2050":@"3",
                     @"2052":@"8",
                     @"2055":@"6",
                     @"2058":@"4",
                     @"2061":@"3",
                     @"2063":@"7",
                     @"2066":@"5",
                     @"2069":@"4",
                     @"2071":@"8",
                     @"2074":@"6",
                     @"2077":@"4",
                     @"2080":@"3",
                     @"2082":@"7",
                     @"2085":@"5",
                     @"2088":@"4",
                     @"2090":@"8",
                     @"2093":@"6",
                     @"2096":@"4",
                     @"2099":@"2",};
    self.chineseMonths = [NSArray arrayWithObjects:
                          @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                          @"九月", @"十月", @"冬月", @"腊月", nil];
    self.chineseDays = [NSArray arrayWithObjects:
                        @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                        @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                        @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    self.backgroundColor = [UIColor colorWithHexString:@"#000000" alpha:0.5];
    self.alpha = 0;
    
    UIView *contentV = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, ContVHeight)];
    [contentV setCornerRadiiWithRoundCornerTopLeft:20 TopRight:20 bottomRight:0 bottomLeft:0];
    contentV.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentV];
    self.contentV = contentV;
    
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(LRSpace, TopToolHeight, ScreenWidth - 2 * LRSpace, ContVHeight - TopToolHeight)];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.dataSource=self;
    self.pickerView.delegate=self;
    
    [contentV addSubview:self.pickerView];
    //盛放按钮的View
    UIView *upVeiw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, TopToolHeight)];
    upVeiw.backgroundColor = [UIColor whiteColor];
    [contentV addSubview:upVeiw];
    //左边的取消按钮
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(20, 0, 40, TopToolHeight - 5);
    [cancelButton setTitle:AppText_cancel forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor clearColor];
    cancelButton.titleLabel.font = AppFontNormal(17);
    [cancelButton setTitleColor:[UIColor colorWithHexString:@"#18162A"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [upVeiw addSubview:cancelButton];
    
    //右边的确定按钮
    chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    chooseButton.frame = CGRectMake(ScreenWidth - 20 - 40, 0, 40, TopToolHeight - 5);
    [chooseButton setTitle:AppText_confirm forState:UIControlStateNormal];
    chooseButton.backgroundColor = [UIColor clearColor];
    chooseButton.titleLabel.font = AppFontBold(17);
    [chooseButton setTitleColor:[UIColor colorWithHexString:@"#FF77A7"] forState:UIControlStateNormal];
    [chooseButton addTarget:self action:@selector(configButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [upVeiw addSubview:chooseButton];
    
    self.titleL = [UILabel createLabelWithTextColorHexString:@"#18162A" font:AppFontNormal(15) alignment:NSTextAlignmentCenter];
    self.titleL.text = @"请选择时间";
    [upVeiw addSubview:self.titleL];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_greaterThanOrEqualTo(self.titleL.font.pointSize);
        make.centerX.mas_equalTo(upVeiw.mas_centerX);
        make.centerY.mas_equalTo(upVeiw.mas_centerY);
    }];
    
    weakify(self);
    self.typeSegmentedView = [ZSegmentedView viewWithTitles:@[@"公历", @"农历"] cornerRadius:15 selectedColor:ColorHexString(@"#FF77A7") normalColor:ColorHexString(@"#F4FBFC")];
    self.typeSegmentedView.textFont = AppFontNormal(10);
    self.typeSegmentedView.selectedBlock = ^(NSInteger index) {
        [weakSelf typeSegmentedIndex:index];
    };
    [upVeiw addSubview:self.typeSegmentedView];
    [self.typeSegmentedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(96, 30));
        make.centerX.mas_equalTo(upVeiw.mas_centerX);
        make.centerY.mas_equalTo(upVeiw.mas_centerY);
    }];
    
    [self setTopType:DatePickerTopTypeSegment];
    
    startYear = 1900;
    yearRange = 200;
    [self setCurrentDate:[NSDate date]];
}

/**
 阳历转农历
 
 @param date 阳历日期
 @return 返回的农历字符串（例：2003年 正月 廿五）
 */
+ (NSString *)getChineseCalendarWithDate:(NSDate *)date {
    if (!date) {
        return @"";
    }
    NSArray *chineseMonths = [NSArray arrayWithObjects:
                              @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                              @"九月", @"十月", @"冬月", @"腊月", nil];
    NSArray *chineseDays = [NSArray arrayWithObjects:
                            @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                            @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                            @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    NSCalendar *localeCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    unsigned unitFlags =  NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    //农历以公元前2697年为第一个甲子年，60年一个周期
    NSString *y_str = [NSString stringWithFormat:@"%ld", - JiaZiYear + localeComp.era * 60 + localeComp.year];
    NSString *m_str = [chineseMonths safeObjectAtIndex:localeComp.month - 1];
    NSString *d_str = [chineseDays safeObjectAtIndex:localeComp.day - 1];
    NSString *chineseCal_str = [NSString stringWithFormat:@"%@年 %@ %@",y_str, m_str, d_str];
    if (localeComp.leapMonth) {
        chineseCal_str = [NSString stringWithFormat:@"%@年 闰%@ %@",y_str, m_str, d_str];
    }
    return chineseCal_str;
}

@end

