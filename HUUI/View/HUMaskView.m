//
//  HUMaskView.m
//  FreshMarket
//
//  Created by mac on 16/1/30.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUMaskView.h"
#import "UIView+frame.h"
#define KNotReachable @"NotReachable"
#define kOutOfTime @"OutOfTime"
#define kCustom @"Custom"

#define HUSrcName(file) [@"HUUI.bundle" stringByAppendingPathComponent:file]
#define HUFrameworkSrcName(file) [@"HUUI.framework/HUUI.bundle" stringByAppendingPathComponent:file]

@interface HUMaskView ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@property (weak, nonatomic) IBOutlet UIButton *imageBtn;

@property (nonatomic, strong) NSMutableDictionary *imageDict;

@property (nonatomic, copy) void(^reloadAction)();

@end

@implementation HUMaskView

+ (instancetype)maskViewWithReloadAction:(void (^)())reloadAction {
    HUMaskView *maskView = [[[self bundle] loadNibNamed:@"HUMaskView" owner:nil options:nil] lastObject];
    maskView.reloadAction = reloadAction;
    maskView.imageDict = [NSMutableDictionary dictionaryWithCapacity:3];
    maskView.hiddenButtonWhemEmptyData = YES;
    return maskView;
}

+ (NSBundle *)bundle {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"HUUIBundle.bundle" ofType:nil];
    return [NSBundle bundleWithPath:bundlePath];
}

- (void)setTitleType:(HUMaskViewTitleType)titleType {
    [self stopAnimating];
    self.alpha = 1;
    [self.imageBtn setBackgroundImage:[self imageWithTitleType:titleType] forState:UIControlStateNormal];
    
    if (titleType == HUMaskViewTitleTypeCustom) {
        self.reloadBtn.hidden = _hiddenButtonWhemEmptyData;
    }
    else {
        self.reloadBtn.hidden = NO;
    }
}

- (void)setImageNamed:(NSString *)imageNamed forTitleType:(HUMaskViewTitleType)titleType {
    
    NSString *key = nil;
    switch (titleType) {
        case HUMaskViewTitleTypeOutOfTime:
            key = kOutOfTime;
            break;
        case HUMaskViewTitleTypeNotReachable:
            key = KNotReachable;
            break;
        case HUMaskViewTitleTypeCustom:
            key = kCustom;
            break;
    }
    
    UIImage *image = [UIImage imageNamed:imageNamed];
    CGSize size = image.size;
    self.imageBtn.size = CGSizeMake(size.width/2, size.height/2);
    [self setNeedsLayout];
    
    _imageDict[key] = [UIImage imageNamed:imageNamed];
}

- (void)startAnimating {
    
    if (!self.activityIndicator.isAnimating) {
        [_activityIndicator startAnimating];
        self.imageBtn.hidden = YES;
        self.reloadBtn.hidden = YES;
    }
}

- (void)stopAnimating {
    if (self.activityIndicator.isAnimating) {
        [self.activityIndicator stopAnimating];
        self.imageBtn.hidden = NO;
        self.reloadBtn.hidden = YES;
        self.alpha = 0;
    }
}

- (void)addFreshTarget:(id)target action:(SEL)action {
    if (!target || !action) {
        return;
    }
 
    if ([target respondsToSelector:action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action withObject:nil];
#pragma clang diagnostic pop
        
    }
}

#pragma mark - private

- (UIImage *)imageWithTitleType:(HUMaskViewTitleType)titleType {
    NSString *key = nil;
    switch (titleType) {
        case HUMaskViewTitleTypeOutOfTime:
            key = kOutOfTime;
            break;
        case HUMaskViewTitleTypeNotReachable:
            key = KNotReachable;
            break;
        case HUMaskViewTitleTypeCustom:
            key = kCustom;
            break;
    }
    
    return  _imageDict[key] ;
}


- (IBAction)reloadAction:(id)sender {
    if (self.reloadAction) {
        [self startAnimating];
        self.reloadAction();
        
    }
}


@end
