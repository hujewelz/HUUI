//
//  HUBasicTableViewController.h
//  PigFarm
//
//  Created by mac on 16/3/1.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUMaskView.h"
#import "HURefreshProtocol.h"

@interface HUBasicTableViewController : UITableViewController <HUViewControllerRefreshable, HUViewControllerPagable>

/*! 加载视图 */
@property (nonatomic, strong) HUMaskView *maskView;

/*! 是否允许加载视图 默认为允许 */
@property (nonatomic, assign) BOOL allowMaskView;
@property (nonatomic, assign) NSInteger currentPage;

/*! 在viewController的view加载完成后，才能调用*/
- (void)didLoadSubViews;

/*! 开始请求，需要子类重载*/
- (void)startRequest;

@end
