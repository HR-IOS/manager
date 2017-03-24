//
//  HRWebVC.m
//  caip
//
//  Created by 王华瑞 on 17/3/24.
//  Copyright © 2017年 UT. All rights reserved.
//

#import "HRWebVC.h"

@interface HRWebVC ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HRWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.zlc518.com"]];
    [self.webView loadRequest:request];
}


@end
