//
//  UIButton+Extention.h
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extention)

- (void)centerImageAndTitle:(float)spacing;
- (void)centerImageAndTitle;

+ (UIButton *)buttonWithImageNamed:(NSString *)imageNamed selectedImageNamed:(NSString *)selectedName;
+ (UIButton *)buttonWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle;

@end
