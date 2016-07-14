//
//  ViewController.m
//  HUUI
//
//  Created by mac on 16/7/14.
//  Copyright © 2016年 hujewelz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [super didLoadSubViews];
    
    [self.maskView setImageNamed:@"me2.jpg" forTitleType:HUMaskViewTitleTypeOutOfTime];
    [self.maskView setImageNamed:@"me2.jpg" forTitleType:HUMaskViewTitleTypeNotReachable];
    [self.maskView setImageNamed:@"me2.jpg" forTitleType:HUMaskViewTitleTypeCustom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startRequest {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.maskView stopAnimating];
        //[self.maskView setTitleType:HUMaskViewTitleTypeCustom];
    });
}

- (void)refreshForNewData:(MJRefreshNormalHeader *)header {
    NSLog(@"refresh new data...");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [header endRefreshing];
        
    });
}

- (UIView *)refreshHeaderInView:(MJRefreshNormalHeader *)header {
    return self.tableView;
}

@end
