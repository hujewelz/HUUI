//
//  macro.h
//  HUUI
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

#ifndef macro_h
#define macro_h

#define UIColor(r, g, b, a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SETIMAGE(imageNamed) [UIImage imageNamed:(imageNamed)]
#define FONT_SIZE(size) [UIFont systemFontOfSize:(size)]

#define kSCREEN_SCALE [UIScreen mainScreen].scale*0.5
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kSCREEN_RECT [UIScreen mainScreen].bounds

#endif /* macro_h */
