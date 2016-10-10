//
//  HUBasicViewController.m
//  PigFarm
//
//  Created by mac on 16/3/1.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUBasicViewController.h"


@interface HUBasicViewController ()


@end

@implementation HUBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    _allowMaskView = YES;
    _autoLoadDataWhenViewDidLoad = YES;
    // Do any additional setup after loading the view.
    
    
}

- (void)didLoadSubViews {
    __weak __typeof(self) weakself = self;
    if (_allowMaskView) {
        _maskView = [HUMaskView maskViewWithReloadAction:^{
            [weakself startRequest];
        }];
        _maskView.frame = self.view.bounds;
        [self.view addSubview:_maskView];
        if (_autoLoadDataWhenViewDidLoad) {
            [self.maskView addFreshTarget:self action:@selector(startRequest)];
        }
        
    }
   
    if ([self respondsToSelector:@selector(refreshHeaderInView:)] && [self refreshHeaderInView:nil] !=nil ) {
        //添加下拉刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewdata:)];
        header.lastUpdatedTimeLabel.hidden = YES;
        
        UIView *headerView = [self refreshHeaderInView:header];
        if ([headerView isKindOfClass:[UITableView class]]) {
            UITableView  *tableView = (UITableView *)headerView;
            tableView.mj_header = header;
        }
        else if ([headerView isKindOfClass:[UICollectionView class]]) {
            UICollectionView  *collectionView = (UICollectionView *)headerView;
            collectionView.mj_header = header;
        }
        
    }
    
    if ([self respondsToSelector:@selector(refreshFooterInView:)] && [self refreshFooterInView:nil] != nil) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(reloadPagedata:)];
        [footer setTitle:@"已经到底了" forState:MJRefreshStateNoMoreData];
        UIView *footerView = [self refreshFooterInView:footer];
        if ([footerView isKindOfClass:[UITableView class]]) {
            UITableView  *tableView = (UITableView *)footerView;
            tableView.mj_footer = footer;
        }
        else if ([footerView isKindOfClass:[UICollectionView class]]) {
            UICollectionView  *collectionView = (UICollectionView *)footerView;
            collectionView.mj_footer = footer;
        }
    }
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startRequest {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)refreshForNewData:(MJRefreshNormalHeader *)header {
    
    [self startRequest];
}

- (void)refreshForPageData {}

- (UIView *)refreshHeaderInView:(MJRefreshNormalHeader *)header {
    return nil;
}

- (UIView *)refreshFooterInView:(MJRefreshAutoNormalFooter *)footer {
    return nil;
}

#pragma mark - private
- (void)reloadNewdata:(MJRefreshNormalHeader *)header {
    if (header.isRefreshing) {
        [self refreshForNewData:header];
    }
}


- (void)reloadPagedata:(MJRefreshAutoNormalFooter *)footer {
    if (footer.isRefreshing) {
        [self refreshForPageData:footer];
    }
}



@end
