//
//  HUNavgationBar.h
//  FreshMarket
//
//  Created by mac on 16/1/20.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HUBarButtonItem : UIButton

//- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//
//- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(NSString *)image highLighted:(NSString *)highImage target:(id)target action:(SEL)action ;

+ (instancetype)leftItemWithImage:(NSString *)image highLighted:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)rightItemWithImage:(NSString *)image highLighted:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end


@interface HUNavgationBar : UIView

+ (instancetype)navgationBar;

- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithLeftItem:(HUBarButtonItem *)barItem;
- (instancetype)initWithRightItem:(HUBarButtonItem *)barItem;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) HUBarButtonItem *letfBarItem;
@property (nonatomic, strong) HUBarButtonItem *rightBarItem;


@property (nonatomic, strong) UIView *letfView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIView *rightView;
//@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@end

