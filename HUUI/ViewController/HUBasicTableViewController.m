//
//  HUBasicTableViewController.m
//  PigFarm
//
//  Created by mac on 16/3/1.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUBasicTableViewController.h"

@interface HUBasicTableViewController ()

@end

@implementation HUBasicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _allowMaskView = YES;
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
        [self.maskView addFreshTarget:self action:@selector(startRequest)];
    }
    
    if ([self respondsToSelector:@selector(refreshHeaderInView:)] && [self refreshHeaderInView:nil] !=nil ) {
        //添加下拉刷新
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewdata:)];
        header.lastUpdatedTimeLabel.hidden = YES;
        self.tableView.mj_header = header;
        
    }
    
    if ([self respondsToSelector:@selector(refreshFooterInView:)] && [self refreshFooterInView:nil] != nil) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(reloadPagedata:)];
        [footer setTitle:@"已经到底了" forState:MJRefreshStateNoMoreData];
        self.tableView.mj_footer = footer;
      
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
    
}

- (void)refreshForNewData:(MJRefreshNormalHeader *)header {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
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
