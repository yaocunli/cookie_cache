
//
//  WebVC.m
//  Cookie
//
//  Created by lcy on 17/3/28.
//  Copyright © 2017年 NanJing. All rights reserved.
//

#import "WebVC.h"

@interface WebVC ()
@property (weak, nonatomic) IBOutlet UIWebView *BigWebView;

@end

@implementation WebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL * url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    [_BigWebView loadRequest:req];
    
}




@end
