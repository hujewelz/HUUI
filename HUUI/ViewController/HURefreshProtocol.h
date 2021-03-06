//
//  HURefreshProtocol.h
//  HUUI
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJRefresh.h"

@protocol HUViewControllerRefreshable <NSObject>

/*!
 下拉刷新
 @return UIView 下拉刷新控件所在的视图
 */
- (UIView *)refreshHeaderInView:(MJRefreshNormalHeader *)header;

@optional
/*! 下拉刷新 */
- (void)refreshForNewData:(MJRefreshNormalHeader *)header;

@end

@protocol HUViewControllerPagable <NSObject>

@property (nonatomic, assign) NSInteger currentPage;

/*! 
 上拉分页
 @return UIView 下拉刷新控件所在的视图
 */
- (UIView *)refreshFooterInView:(MJRefreshAutoNormalFooter *)footer;

@optional
/*! 上拉分页 */
- (void)refreshForPageData:(MJRefreshAutoNormalFooter *)footer;;

@end
