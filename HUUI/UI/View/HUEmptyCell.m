//
//  MAEmptyCell.m
//  ModelArea
//
//  Created by mac on 15/9/21.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUEmptyCell.h"
#import "macro.h"
//#import <Masonry.h>

@interface HUEmptyCell ()

@property (nonatomic, weak) UIImageView *myImageView;
@property (nonatomic, weak) UILabel *defaultLab;

@end

@implementation HUEmptyCell

+ (instancetype)cellWithTableview:(UITableView *)tableView {
    static NSString *Id = @"EmptyCell";
    HUEmptyCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[HUEmptyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.separatorInset = UIEdgeInsetsMake(0, kSCREEN_WIDTH*0.5, 0, -kSCREEN_WIDTH*0.5);
        
        UIImageView *imageView = [UIImageView new];
        [self.contentView addSubview:imageView];
        _myImageView = imageView;
        //_myImageView.backgroundColor = [UIColor yellowColor];
//        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.mas_centerX);
//            //make.bottom.equalTo(self.mas_centerY).offset(-40);
//            make.centerY.equalTo(imageView.superview.mas_centerY).offset(-60);
//        }];
        
//        UILabel *lab = [UILabel new];
//        lab.font = FONT_SIZE(16);
//        lab.textColor = [UIColor blackColor] ;
//        lab.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:lab];
//        _defaultLab = lab;
//        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.mas_centerX);
//            make.top.equalTo(imageView.mas_bottom).offset(10);
//        }];
//
        
        _emptyLabel = [UILabel new];
        _emptyLabel.font = FONT_SIZE(16);
        _emptyLabel.textColor = [UIColor blackColor] ;
        _emptyLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_emptyLabel];
        
//        [_emptyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.mas_centerX);
//            make.top.equalTo(imageView.mas_bottom).offset(10);
//        }];
        
        _button = [UIButton new];
        //_button.backgroundColor = kDefaultTitleColor;
        _button.layer.cornerRadius = 6;
        _button.layer.masksToBounds = YES;
        _button.hidden = YES;
        [self.contentView addSubview:_button];
//        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.mas_centerX);
//            make.top.equalTo(_emptyLabel.mas_bottom).offset(15);
//            make.width.mas_equalTo(100);
//            make.height.mas_equalTo(34);
//        }];
    }
    
    return self;
}

//- (void)setDefaultText:(NSString *)defaultText {
//    _defaultText = defaultText;
//    if (_defaultText == nil) {
//        _defaultLab.hidden = YES;
//    }
//    else {
//        _defaultLab.hidden = NO;
//        _defaultLab.text = defaultText;
//    }
//    
//}

/*设置图片名*/
- (void)setEmptyMsg:(NSString *)emptyMsg {
    _emptyMsg = emptyMsg;
    //_emptyLabel.hidden = YES;
    UIImage *image = [UIImage imageNamed:emptyMsg];
    self.myImageView.image = image;
}

/*设置描述文字*/
- (void)setEmptyText:(NSString *)emptyText {
    _emptyText = emptyText;
    self.emptyLabel.text = emptyText;
}

/*设置按钮文字*/
- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    
    _button.hidden = buttonTitle == nil;
    if (buttonTitle) {
        [self.button setTitle:buttonTitle forState:UIControlStateNormal];
    }
    
    
}

@end
