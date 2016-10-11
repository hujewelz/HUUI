//
//  MAConfigCell.m
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import "HUConfigCell.h"

@implementation HUConfigCell

+ (UINib *)nib { return nil; }

+ (instancetype)cellWithTableview:(UITableView *)tableView {return nil;}
+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath { return nil; }

+ (NSString *)reuseableIdentifier { return nil; }
+ (CGFloat)rowHeight {return 44;}

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation HUConfigCollectionCell

+ (UINib *)nib { return nil; }
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView { return nil; }
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{ return nil; }
+ (NSString *)reuseableIdentifier {return nil;}


@end