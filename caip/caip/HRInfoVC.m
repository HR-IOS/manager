//
//  HRInfoVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRInfoVC.h"

@interface HRInfoVC () <UIWebViewDelegate>

@property (weak, nonatomic) UIWebView *webView;

@end

@implementation HRInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItems = nil;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationItem.leftBarButtonItems = nil;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news.soa.woying.com/"]];
    [webView loadRequest:request];
    [SVProgressHUD showWithStatus:@"加载中"];
}

- (void)back {
    [self.webView goBack];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
    if (webView.canGoBack) {
        UIBarButtonItem *item = [UIBarButtonItem itemWithTargat:self action:@selector(back) image:@"back_icon" highImage:@"back_icon"];
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
        negativeSpacer.width = - 6;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,item];
    } else {
        self.navigationItem.leftBarButtonItems = nil;
    }
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:@"加载失败"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news.soa.woying.com/"]];
    [webView loadRequest:request];
    [SVProgressHUD showWithStatus:@"加载中"];
}


@end
