//
//  WBPlacehodelerTextView.h
//  微博
//
//  Created by jewelz on 15/8/16.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUPlacehodelerTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
