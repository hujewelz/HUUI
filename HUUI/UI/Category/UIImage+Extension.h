//
//  UIImage+Extension.h
//  微博
//
//  Created by jewelz on 15/8/9.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (NSData *)imageByScalingAndCroppingForSize:(CGSize)targetSize withMaxLength:(NSUInteger)maxLength;
- (UIImage *)fixOrientation;

- (UIImage *)circleImageWithsize:(CGSize)size radius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIImage *)imageWithColor:(UIColor *)color;

@end
