//
//  HRBaseTabBarController.m
//  caip
//
//  Created by 王华瑞 on 17/3/23.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRBaseTabBarController.h"
#import "HRBaseNavigationVC.h"
#import "HRHomeVC.h"
#import "HRInfoVC.h"
#import "HRHelpVC.h"

@interface HRBaseTabBarController () <UITabBarControllerDelegate>

@end

@implementation HRBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //tabBarViewController代理
    self.delegate = self;
    [self addChildViewController:[[HRHomeVC alloc] init] title:@"开奖" image:@"kaijiang_nor" selectedImage:@"kaijiang_sel"];
    [self addChildViewController:[[HRInfoVC alloc] init] title:@"资讯" image:@"zixun_nor" selectedImage:@"zixun_sel"];
    [self addChildViewController:[[HRHelpVC alloc] init] title:@"帮助" image:@"bangzhu_nor" selectedImage:@"bangzhu_sel"];
}

- (void)addChildViewController:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVC.tabBarItem  setTitleTextAttributes:@{NSForegroundColorAttributeName : UTRGB(136, 136, 136, 1)} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UTRGB(39, 38, 54, 1)} forState:UIControlStateSelected];
    HRBaseNavigationVC *navigationVC = [[HRBaseNavigationVC alloc] initWithRootViewController:childVC];
    [self addChildViewController:navigationVC];
}

#pragma mark - UTTabBarDelegate
//禁止tab多次点击
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UIViewController *tbselect = tabBarController.selectedViewController;
    if([tbselect isEqual:viewController]){
        return NO;
    }
    return YES;
}
@end
