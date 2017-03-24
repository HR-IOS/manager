//
//  HRBaseViewController.m
//  caip
//
//  Created by 王华瑞 on 17/3/23.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRBaseViewController.h"

@interface HRBaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation HRBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *item = [UIBarButtonItem itemWithTargat:self action:@selector(back) image:@"back_icon" highImage:@"back_icon"];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    negativeSpacer.width = - 6;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,item];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    } else {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

#pragma mark - custome
- (void)back {
    [self.view endEditing:YES];
    if ([self.navigationController.viewControllers count] > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
