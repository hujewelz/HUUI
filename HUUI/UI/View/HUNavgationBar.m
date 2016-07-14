//
//  HUNavgationBar.m
//  FreshMarket
//
//  Created by mac on 16/1/20.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUNavgationBar.h"
#import "UIView+frame.h"
#import "UIButton+Extention.h"

static const CGSize BUTTON_SIZE = {60, 44};

@implementation HUBarButtonItem

- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    self = [self init];
    [self setTitle:title forState:UIControlStateNormal];
    return self;
}
//
//- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action {
//    
//}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, 60, 44)];
    if (self) {
        self.backgroundColor  = [UIColor redColor];
    
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    return [[HUBarButtonItem alloc] initWithTitle:title target:target action:action];
}

+ (instancetype)itemWithImage:(NSString *)image highLighted:(NSString *)highImage target:(id)target action:(SEL)action {
    HUBarButtonItem *btn = [self buttonWithImage:image highLighted:highImage];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)leftItemWithImage:(NSString *)image highLighted:(NSString *)highImage target:(id)target action:(SEL)action {
    
    HUBarButtonItem *btn = [self buttonWithImage:image highLighted:highImage];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)rightItemWithImage:(NSString *)image highLighted:(NSString *)highImage target:(id)target action:(SEL)action {
    
    HUBarButtonItem *btn = [self buttonWithImage:image highLighted:highImage];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)buttonWithImage:(NSString *)image highLighted:(NSString *)highImage {
    HUBarButtonItem *btn = (HUBarButtonItem *)[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    btn.size = BUTTON_SIZE;
    return btn;
}



@end

#define kWidth [UIScreen mainScreen].bounds.size.width

const static CGFloat KNarHeight = 64;

@interface HUNavgationBar ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HUNavgationBar

+ (instancetype)navgationBar {
    return [[self alloc] init];
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [self initWithFrame:CGRectMake(0, 0, kWidth, KNarHeight)];
    
    if (self) {
        _titleLabel.text = title;
    }
    
    return self;
}
- (instancetype)initWithLeftItem:(HUBarButtonItem *)barItem {
    self = [self initWithFrame:CGRectMake(0, 0, kWidth, KNarHeight)];
    
    if (self) {
        _letfBarItem = barItem;
        //_letfBarItem.backgroundColor = [UIColor redColor];
        [self addSubview:_letfBarItem];
    }
    
    return self;
}

- (instancetype)initWithRightItem:(HUBarButtonItem *)barItem {

    self = [self initWithFrame:CGRectMake(0, 0, kWidth, KNarHeight)];
    
    if (self) {
        _rightBarItem = barItem;
        //_rightBarItem.backgroundColor = [UIColor redColor];
        [self addSubview:_rightBarItem];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, 0, kWidth, KNarHeight)]) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _letfBarItem.frame = CGRectMake(15, 20, 80, 44);
    _titleLabel.frame = CGRectMake((self.width-100)/2, (44-32)/2+20, 100, 32);
    _rightBarItem.frame = CGRectMake(self.frame.size.width-80-15, 20, 80, 44);
    
}

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    self.titleLabel.textColor = tintColor;
}

- (void)setTitleView:(UIView *)titleView {
    _titleView = titleView;
    [titleView removeFromSuperview];
    [self addSubview:titleView];
    //NSLog(@"title frame: %@", NSStringFromCGRect(titleView.frame));
}

- (void)setLetfView:(UIView *)letfView {
    _letfView = letfView;
    [letfView removeFromSuperview];
    [self addSubview:letfView];
    //NSLog(@"left frame: %@", NSStringFromCGRect(letfView.frame));
}

- (void)setRightView:(UIView *)rightView {
    _rightView = rightView;
    [rightView removeFromSuperview];
    [self addSubview:rightView];
    //NSLog(@"right frame: %@", NSStringFromCGRect(rightView.frame));
}

- (void)setLetfBarItem:(HUBarButtonItem *)letfBarItem {
    _letfBarItem = letfBarItem;
    [letfBarItem removeFromSuperview];
    [self addSubview:_letfBarItem];
}

- (void)setRightBarItem:(HUBarButtonItem *)rightBarItem {
    _rightBarItem = rightBarItem;
    [rightBarItem removeFromSuperview];
    [self addSubview:rightBarItem];
}

- (void)setBarTintColor:(UIColor *)barTintColor {
    _barTintColor = barTintColor;
    self.backgroundColor = barTintColor;
}

@end
