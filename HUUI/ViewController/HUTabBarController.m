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
   // self.tabBar.barTintColor = kDefaultColor;
//    
//    LOLHomeViewController *vc1 = [[LOLHomeViewController alloc] init];
//    [self addChildViewController:vc1 withTitle:@"首页" image:@"tab_home_n" andSelectedImage:@"tab_home_s"];
//    
//    UIViewController *vc2 = [[LOLEntViewController alloc] init];
//    [self addChildViewController:vc2 withTitle:@"娱乐" image:@"tab_ent_n" andSelectedImage:@"tab_ent_s"];
//    
//    UIViewController *vc3 = [[LOLNewsViewController alloc] init];
//    [self addChildViewController:vc3 withTitle:@"资讯" image:@"tab_news_n" andSelectedImage:@"tab_news_s"];
//    
//    UIViewController *vc4 = [[LOLProfileViewController alloc] init];
//    [self addChildViewController:vc4 withTitle:@"我" image:@"tab_profile_n" andSelectedImage:@"tab_profile_s"];
    
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title image:(NSString *)image andSelectedImage:(NSString *)selectedImage{
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    
    //设置选择的图片 imageWithRenderingMode设置图片渲染模式 UIImageRenderingModeAlwaysOriginal：不渲染
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    NSDictionary *attributeNormal = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
//    NSDictionary *attributeSelected = @{NSForegroundColorAttributeName:kDefaultColor};
//    [childController.tabBarItem setTitleTextAttributes:attributeNormal forState:UIControlStateNormal];
//    [childController.tabBarItem setTitleTextAttributes:attributeSelected forState:UIControlStateSelected];
//    
    
    [self addChildViewController:[[HUNavigationController alloc] initWithRootViewController:childController]];
}




@end
