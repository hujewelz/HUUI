//
//  CustomKeyboard.m
//  keyboard
//
//  Created by zhaowang on 14-3-25.
//  Copyright (c) 2014年 anyfish. All rights reserved.
//

#import "HUNumberKeyboard.h"
#import "UIView+frame.h"
#import "macro.h"

#define kLineWidth 5
#define kToorBarH 44
#define kNumFont [UIFont systemFontOfSize:27]
#define kBGColor [UIColor colorWithRed:188/255.0 green:192/255.0 blue:199/255.0 alpha:1]

@interface HUNumberKeyboard ()

@property (nonatomic, weak) UIView *view;
@property (nonatomic, weak) UITextField *textField;

@end

@implementation HUNumberKeyboard

#define IPHONE_PLUS [UIScreen mainScreen].bounds.size.width > 375


+ (instancetype)numberKeyboardWithTextField:(UITextField *)textField {
    HUNumberKeyboard *keyboard = [[HUNumberKeyboard alloc] init];
    keyboard.textField = textField;
    textField.inputView = keyboard;
    return keyboard;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBGColor;
        CGFloat height = IPHONE_PLUS ? 226 : 216;
        self.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height+kToorBarH);
        [self setupView];
        _maxDigit = 10;
        _maxDecimalpointDigit = 2;
    }
    return self;
}

- (void)setupView {
    UIToolbar *toorBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.width, kToorBarH)];
    [self addSubview:toorBar];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(toorBar.width-60, 0, 60, toorBar.height);
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    [toorBar addSubview:button];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kToorBarH, self.width, 216)];
    view.backgroundColor = kBGColor;
    [self addSubview:view];
    self.view = view;

    for (int i=0; i<4; i++)
    {
        for (int j=0; j<3; j++)
        {
            UIButton *button = [self creatButtonWithX:j Y:i];
            [view addSubview:button];
        }
    }
    
    
}

-(UIButton *)creatButtonWithX:(NSInteger)x Y:(NSInteger)y {
    
    CGFloat width = (self.view.frame.size.width - kLineWidth*4) / 3;
    CGFloat height = (self.view.frame.size.height - kLineWidth*5) / 4;
    CGFloat frameX = (width+kLineWidth) * x + kLineWidth;
    CGFloat framey = (height+kLineWidth) * y + kLineWidth ;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(frameX, framey, width, height);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = FONT_SIZE(17);
    button.layer.cornerRadius = height*0.06;
    button.layer.masksToBounds = YES;
    //
    NSInteger num = x+3*y+1;
    button.tag = num;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIColor *colorNormal = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
    UIColor *colorHightlighted = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1.0];
    
    if ( num == 12)
    {
        UIColor *colorTemp = colorNormal;
        colorNormal = colorHightlighted;
        colorHightlighted = colorTemp;
    }
    button.backgroundColor = colorNormal;
    CGSize imageSize = CGSizeMake(width, 54);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [colorHightlighted set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [button setImage:pressedColorImg forState:UIControlStateHighlighted];
    
    
    UILabel *labelNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    NSString *text = [NSString stringWithFormat:@"%ld",(long)num];
    labelNum.textColor = [UIColor blackColor];
    labelNum.textAlignment = NSTextAlignmentCenter;
    labelNum.font = kNumFont;
    labelNum.tag = 99;
    if (num == 10) {
        text = @"∙";
    }
    if (num == 11) {
        text = @"0";
    }
    
    if (num == 12) {
        text = nil;
        [button setImage:[UIImage imageNamed:@"arrowInKeyboard"] forState:UIControlStateNormal];
    }
    labelNum.text = text;
    [button addSubview:labelNum];
    
    
    return button;
}


-(void)clickButton:(UIButton *)sender {
   
    if (sender.tag == 10) { //小数点
        [self writeInRadixPoint];
       
    }
    else if(sender.tag == 12) { //清除
        [self numberKeyboardBackspace];
    }
    
    else {
        NSInteger num = sender.tag;
        if (sender.tag == 11)
        {
            num = 0;
        }

        [self numberKeyboardInput:num];
    }

    
}

- (void)setMaxDecimalpointDigit:(NSInteger)maxDecimalpointDigit {
    _maxDecimalpointDigit = MAX(maxDecimalpointDigit, 0);
    
}

- (void)setMaxDigit:(NSInteger)maxDigit {
    _maxDigit = MAX(maxDigit, 0);
}

#pragma mark - clear 

-(void)numberKeyboardBackspace {
   
    if (self.textField.text.length != 0) {
        self.textField.text = [self.textField.text substringToIndex:self.textField.text.length -1];
     
    }
}

#pragma mark - inpu 

-(void)numberKeyboardInput:(NSInteger)number {
    
    if (self.textField.text.length >= _maxDigit) {
        return;
    }
    NSArray *values = [self.textField.text componentsSeparatedByString:@"."];
    if (values && values.count >= 2) {
        NSString *value = values[1];
        if (value.length >= _maxDecimalpointDigit) {
            return ;
        }
    }
    self.textField.text = [self.textField.text stringByAppendingString:[NSString stringWithFormat:@"%zd",number]];
    
    if (self.textField.text.length>1 && [self.textField.text hasPrefix:@"0"] && [self.textField.text rangeOfString:@"."].location==NSNotFound) {
        self.textField.text = [[NSString stringWithFormat:@"%zd", number] mutableCopy];
    }
    
}

#pragma mark - input Decimal point

- (void)writeInRadixPoint {
    if (self.textField.text.length >= _maxDigit) {
        return;
    }
    if (_maxDecimalpointDigit == 0) {
        return;
    }
    NSArray *values = [self.textField.text componentsSeparatedByString:@"."];
    
    if (values.count > 1) {
        return;
    }
    
    self.textField.text = [self.textField.text stringByAppendingString:[NSString stringWithFormat:@"%@",@"."]];
    if ([self.textField.text isEqualToString:@"."]) {
        self.textField.text = [@"0." mutableCopy];
    }

}

- (void)dismissAction {
    [self.textField resignFirstResponder];
}



@end
