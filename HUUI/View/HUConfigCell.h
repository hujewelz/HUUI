//
//  MAConfigCell.h
//  ModelArea
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUConfigCell : UITableViewCell

+ (UINib *)nib;
+ (instancetype)cellWithTableview:(UITableView *)tableView;
+ (instancetype)cellWithTableview:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
+ (NSString *)reuseableIdentifier;
+ (CGFloat)rowHeight;

@end


@interface HUConfigCollectionCell : UICollectionViewCell

+ (UINib *)nib;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
+ (NSString *)reuseableIdentifier;

@end