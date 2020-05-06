//
//  ConfirmAlterView.m
//  TimeDiary
//
//  Created by PeiJun on 2019/5/21.
//  Copyright © 2019 brt. All rights reserved.
//

#import "ConfirmAlterView.h"

#define MenuHeight (141 * KWidthRate)
#define LabelH (96 * KWidthRate)

@interface ConfirmAlterView ()
@property (nonatomic, strong) UIView *blackBgview;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) UIView *hline;
@property (nonatomic, strong) UIView *vLine;
@end

@implementation ConfirmAlterView

- (void)dealloc {
    PoLog(@"%@ dealloc", NSStringFromClass([self class]));
}

+ (void)confirmAlterViewWithView:(id)view title:(NSString *)title message:(NSString *)message cancelName:(NSString *)cancelName sureName:(NSString *)sureName cancel:(void (^)(void))cancel sure:(void (^)(void))sure
{
    ConfirmAlterView *alertView = [[ConfirmAlterView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [view addSubview:alertView];
    
    [alertView createSubviews];
    alertView.nameLabel.text = title;
    //布局调整
    if ([NSString isString:message]) {
        //有提示
        alertView.msgLabel.hidden = NO;
        alertView.msgLabel.text = message;
        alertView.nameLabel.height = LabelH * 0.2;
    } else {
        //只有标题
        alertView.msgLabel.hidden = YES;
        alertView.nameLabel.y = 0;
        alertView.nameLabel.height = LabelH * 0.8;
        alertView.containerView.height -= LabelH * 0.2;
        alertView.hline.y -= LabelH * 0.2;
        alertView.vLine.y -= LabelH * 0.2;
        alertView.sureButton.y -= LabelH * 0.2;
        alertView.cancelButton.y -= LabelH * 0.2;
        
        [alertView.sureButton setTitleColor:[UIColor colorWithHexString:@"#007AFF"] forState:UIControlStateNormal];
        alertView.sureButton.titleLabel.font = [UIFont fontWithName:FontName_Bold size:17 * kMinRate];
        
        [alertView.cancelButton setTitleColor:[UIColor colorWithHexString:@"#007AFF"] forState:UIControlStateNormal];
        alertView.cancelButton.titleLabel.font = [UIFont fontWithName:FontName_Bold size:17 * kMinRate];
    }
    if ([NSString isBlankString:cancelName] && [NSString isString:sureName]) {
        alertView.sureButton.width = alertView.containerView.width;
        alertView.sureButton.x = 0;
        alertView.cancelButton.hidden = YES;
        alertView.vLine.hidden = YES;
    } else if ([NSString isBlankString:sureName] && [NSString isString:cancelName]) {
        alertView.cancelButton.width = alertView.containerView.width;
        alertView.sureButton.hidden = YES;
        alertView.vLine.hidden = YES;
    }
    //
    [alertView.cancelButton setTitle:cancelName forState:UIControlStateNormal];
    [alertView.sureButton setTitle:sureName forState:UIControlStateNormal];
    alertView.sureBlock = sure;
    alertView.cancelBlock = cancel;
    [alertView animateShowAlertview];
}

- (instancetype)init
{
    if ([super init]) {
        
    }
    return self;
}

- (void)createSubviews
{
    self.blackBgview = [[UIView alloc] initWithFrame:self.bounds];
    self.blackBgview.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1];
    self.blackBgview.alpha = 0.6;
    self.blackBgview.hidden = YES;
    [self addSubview:self.blackBgview];
    UITapGestureRecognizer *noTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction)];
    [self.blackBgview addGestureRecognizer:noTap];
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(50 * KWidthRate, ScreenHeight, ScreenWidth - 2 * 50 * KWidthRate, MenuHeight)];
    self.containerView.centerX = ScreenWidth * 0.5;
    self.containerView.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    self.containerView.layer.cornerRadius = 10 * KWidthRate;
    self.containerView.layer.masksToBounds = YES;
    [self addSubview:self.containerView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25 * kMinRate, LabelH * 0.2, self.containerView.width - 2 * 25 * kMinRate, LabelH * 0.2)];
    label.numberOfLines = 0;
    label.textColor = [UIColor colorWithHexString:@"#000000"];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:FontName_Bold size:17 * kMinRate];
    [self.containerView addSubview:label];
    self.nameLabel = label;
    
    UILabel *msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(25 * kMinRate, LabelH * 0.4, self.containerView.width - 2 * 25 * kMinRate, LabelH * 0.4)];
    msgLabel.numberOfLines = 0;
    msgLabel.textColor = [UIColor colorWithHexString:@"#000000"];
    msgLabel.textAlignment = NSTextAlignmentCenter;
    msgLabel.font = AppFontNormal(13 * kMinRate);
    [self.containerView addSubview:msgLabel];
    self.msgLabel = msgLabel;
    
    //确定
//    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    okButton.frame = CGRectMake(self.containerView.width / 2.0f, self.containerView.height - 44 * KWidthRate, self.containerView.width / 2.0f, 44 * KWidthRate);
//    [okButton setBackgroundImage:[YYImage yy_imageWithColor:[UIColor colorWithHexString:@"#F7F7F7"]] forState:UIControlStateNormal];
//    [okButton setBackgroundImage:[YYImage yy_imageWithColor:[UIColor colorWithHexString:@"#e5e5e5"]] forState:UIControlStateHighlighted];
//    [okButton setTitleColor:[UIColor colorWithHexString:@"#FF77B4"] forState:UIControlStateNormal];
//    okButton.titleLabel.font = [UIFont fontWithName:FontName_Bold size:15 * kMinRate];
//    [okButton addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.containerView addSubview:okButton];
//    self.sureButton = okButton;
//    //取消
//    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    cancleButton.frame = CGRectMake(0, self.containerView.height - 44 * KWidthRate, self.containerView.width / 2.0f, 44 * KWidthRate);
//    [cancleButton setBackgroundImage:[YYImage yy_imageWithColor:[UIColor colorWithHexString:@"#F7F7F7"]] forState:UIControlStateNormal];
//    [cancleButton setBackgroundImage:[YYImage yy_imageWithColor:[UIColor colorWithHexString:@"#e5e5e5"]] forState:UIControlStateHighlighted];
//    [cancleButton setTitleColor:[UIColor colorWithHexString:@"#737373"] forState:UIControlStateNormal];
//    cancleButton.titleLabel.font = AppFontNormal(15 * kMinRate);;
//    [cancleButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.containerView addSubview:cancleButton];
//    self.cancelButton = cancleButton;
//    
//    //横线
//    UIView *hline = [[UIView alloc] initWithFrame:CGRectMake(0, okButton.y - 0.5, self.containerView.width, 0.5)];
//    hline.backgroundColor = [UIColor colorWithHexString:@"#dddddd"];
//    [self.containerView addSubview:hline];
//    self.hline = hline;
//    //竖线
//    UIView *vline = [[UIView alloc] initWithFrame:CGRectMake(self.containerView.width / 2.0f, 0, 0.5, okButton.height)];
//    vline.centerY = okButton.centerY;
//    vline.backgroundColor = [UIColor colorWithHexString:@"#dddddd"];
//    [self.containerView addSubview:vline];
//    self.vLine = vline;
}

- (void)animateShowAlertview
{
    self.blackBgview.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.centerY = ScreenHeight * 0.5;
    }];
}

- (void)animatedHideAlertview
{
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.y = ScreenHeight;
    } completion:^(BOOL finished) {
        self.blackBgview.hidden = YES;
        [self removeFromSuperview];
        __block UIView *view = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            view = nil;
        });
    }];
}

- (void)cancelAction
{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [self animatedHideAlertview];
}

- (void)sureAction
{
    if (self.sureBlock) {
        self.sureBlock();
    }
    [self animatedHideAlertview];
}

- (void)closeAction {
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    if ([touch.view isEqual:self.blackBgview]) {
//        [self animatedHideAlertview];
//    }
//
//}

@end
