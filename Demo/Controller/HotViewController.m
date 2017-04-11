//
//  HotViewController.m
//  网易新闻
//
//  Created by xiaomage on 15/10/23.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "HotViewController.h"

@interface HotViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.UIWebView加载页面
    [self createWebView];
}


#pragma mark - UIWebView加载页面
- (void)createWebView
{
    NSString *webUrl = [NSString stringWithFormat:@"http://zdl.pr-leader.cn/html/tf.html"];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:webUrl]];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height - 64)];
    [self.view addSubview:_webView];
    [_webView loadRequest:request];
}

@end
