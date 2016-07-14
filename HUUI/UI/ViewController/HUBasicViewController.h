//
//  HUBasicViewController.h
//  PigFarm
//
//  Created by mac on 16/3/1.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUMaskView.h"

#import "HURefreshProtocol.h"



@interface HUBasicViewController : UIViewController <HUViewControllerRefreshable, HUViewControllerPagable>



@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) HUMaskView *maskView;
@property (nonatomic, assign) BOOL allowMaskView;


- (void)didLoadSubViews;
- (void)startRequest;



@end
