//
//  CustomKeyboard.h
//  keyboard
//
//  Created by zhaowang on 14-3-25.
//  Copyright (c) 2014年 anyfish. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HUNumberKeyboard : UIView


+ (instancetype)numberKeyboardWithTextField:(UITextField *)textField;

/**允许的最大位数，默认为10位*/
@property (nonatomic, assign) NSInteger maxDigit;

/**允许的最大位小数位数，默认为2位*/
@property (nonatomic, assign) NSInteger maxDecimalpointDigit;


@end
