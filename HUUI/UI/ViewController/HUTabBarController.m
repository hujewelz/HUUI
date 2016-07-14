//
//  WBTabBarController.m
//  微博
//
//  Created by jewelz on 15/4/23.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import "HUTabBarController.h"
#import "HUNavigationController.h"
#import "macro.h"


@interface HUTabBarController ()

@end

@implementation HUTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tabBar.barTintColor = kDefaultColor;
    
//    MMTHomeViewController *vc1 = [[MMTHomeViewController alloc] initWithViewModel:[[MMTHomeViewModel alloc]init]];
//    [self addChildViewController:vc1 withTitle:@"首页" image:@"tab_home_n" andSelectedImage:@"tab_home_s"];
//    
//    UIViewController *vc2 = [[MMTMessageViewController alloc] init];
//    [self addChildViewController:vc2 withTitle:@"消息" image:@"tab_message_n" andSelectedImage:@"tab_message_s"];
//    
//    UIViewController *vc3 = [[MMTProfileViewController alloc] init];
//    [self addChildViewController:vc3 withTitle:@"我" image:@"tab_profile_n" andSelectedImage:@"tab_profile_s"];
    
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title image:(NSString *)image andSelectedImage:(NSString *)selectedImage{
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    
    //设置选择的图片 imageWithRenderingMode设置图片渲染模式 UIImageRenderingModeAlwaysOriginal：不渲染
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSDictionary *attributeNormal = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    NSDictionary *attributeSelected = @{NSForegroundColorAttributeName:UIColor(102, 99, 192, 1)};
    [childController.tabBarItem setTitleTextAttributes:attributeNormal forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:attributeSelected forState:UIControlStateSelected];
    
    
    [self addChildViewController:[[HUNavigationController alloc] initWithRootViewController:childController]];
}




@end
