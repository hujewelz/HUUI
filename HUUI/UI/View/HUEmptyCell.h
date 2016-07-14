//
//  MAEmptyCell.h
//  ModelArea
//
//  Created by mac on 15/9/21.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUEmptyCell : UITableViewCell

@property (nonatomic, strong) UILabel *emptyLabel;
@property (nonatomic, strong) UIButton *button;


@property (nonatomic, strong) NSString *defaultText;
/**标签文字*/
@property (nonatomic, strong) NSString *emptyText;
/**图片名*/
@property (nonatomic, strong) NSString *emptyMsg;

/**按钮文字*/
@property (nonatomic, strong) NSString *buttonTitle;

+ (instancetype)cellWithTableview:(UITableView *)tableView;
@end
