//
//  HRBaseNavigationVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/23.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRBaseNavigationVC.h"

@interface HRBaseNavigationVC ()

@end

@implementation HRBaseNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - custome
- (void)setup {
    //背景颜色
    self.navigationBar.barTintColor = [UIColor colorWithHexString:@"#ffffff"];
    //title字体的属性
    self.navigationBar.titleTextAttributes = @{
                                               NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#333333"],
                                               NSFontAttributeName : [UIFont systemFontOfSize:17]
                                               };
    
    self.navigationBar.tintColor = [UIColor colorWithHexString:@"#333333"];
}

- (void)back {
    [self.view endEditing:YES];
    if ([self.navigationController.viewControllers count] > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *item = [UIBarButtonItem itemWithTargat:self action:@selector(back) image:@"back_icon" highImage:@"back_icon"];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
        negativeSpacer.width = - 6;
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,item];
    }
    [super pushViewController:viewController animated:animated];
}

@end
