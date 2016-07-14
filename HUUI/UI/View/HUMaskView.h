//
//  HUMaskView.h
//  FreshMarket
//
//  Created by mac on 16/1/30.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HUMaskViewTitleType) {
    HUMaskViewTitleTypeNotReachable = 0,
    HUMaskViewTitleTypeOutOfTime,
    HUMaskViewTitleTypeCustom
    
};

@interface HUMaskView : UIView

+ (instancetype)maskViewWithReloadAction:(void(^)())reloadAction;

@property (nonatomic, assign) HUMaskViewTitleType titleType;

- (void)setImageNamed:(NSString *)imageNamed forTitleType:(HUMaskViewTitleType)titleType;

- (void)addFreshTarget:(id)target action:(SEL)action;

- (void)startAnimating;

- (void)stopAnimating;

@end
