//
//  ConfirmAlterView.h
//  TimeDiary
//
//  Created by PeiJun on 2019/5/21.
//  Copyright © 2019 brt. All rights reserved.
//

#import <UIKit/UIKit.h>

//和PPAlertView功能一样，但只区分确定和取消两种状态。

@interface ConfirmAlterView : UIView

@property (nonatomic, copy) void(^cancelBlock) (void);
@property (nonatomic, copy) void (^sureBlock)(void);

+ (void)confirmAlterViewWithView:(id)view title:(NSString *)title message:(NSString *)message cancelName:(NSString *)cancelName sureName:(NSString *)sureName cancel:(void(^)(void))cancel sure:(void(^)(void))sure;


@end
