//
//  UIButton+Extention.m
//  ModelArea
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "UIButton+Extention.h"
#import "UIView+frame.h"
#import "macro.h"

@implementation UIButton (Extention)

- (void)centerImageAndTitle:(float)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // get the height they will take up as a unit
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
}

- (void)centerImageAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    [self centerImageAndTitle:DEFAULT_SPACING];
}

+ (UIButton *)buttonWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    //[button setBackgroundColor:kDefaultColor];
    button.selected = NO;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT_SIZE(16);
    button.layer.cornerRadius = 15;
    button.layer.masksToBounds = YES;
    
    return button;
}

+ (UIButton *)buttonWithImageNamed:(NSString *)imageNamed selectedImageNamed:(NSString *)selectedName {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    //[button setBackgroundColor:kDefaultColor];
    button.selected = NO;
    [button setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT_SIZE(16);
    button.layer.cornerRadius = 15;
    
    return button;
}


@end
