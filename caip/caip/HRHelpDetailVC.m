//
//  HRHelpDetailVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRHelpDetailVC.h"

@interface HRHelpDetailVC ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HRHelpDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:self.html ofType:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webView loadRequest:request];
    self.navigationItem.title = self.navTitle;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}


@end
