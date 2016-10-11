//
//  WBPlacehodelerTextView.m
//  微博
//
//  Created by jewelz on 15/8/16.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUPlacehodelerTextView.h"
#import "UIView+frame.h"

@implementation HUPlacehodelerTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    if (self.hasText) return ;
    
    //文字属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = self.placeholderColor ? self.placeholderColor : [UIColor lightGrayColor];
    if (self.font) {
        dict[NSFontAttributeName] = self.font;
    }
    
    //画文字
    [self.placeholder drawInRect:CGRectMake(5, 8, self.width-5*2, self.height) withAttributes:dict];
}

- (void)textDidChange {
    //重绘
    [self setNeedsDisplay];
    
    //NSLog(@"textDidChange");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self]; 
}

@end
