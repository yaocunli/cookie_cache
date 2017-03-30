//
//  ViewController.m
//  Cookie
//
//  Created by lcy on 17/3/28.
//  Copyright © 2017年 NanJing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     1.Cache是缓存，web控件会自动帮你缓存网络文件，再次打开就会读取缓存文件，打开速度快.
     2.Cookie是http协议下的一个方法，在本地存放一些数据，比如存储你的用户名密码,
     2.1:例如：当我们登录一个网站的时候经常会勾选“下次自动登录”。第一次登录时，服务器发送了包含登录凭据的Cookie到用户的硬盘上。第二次登录的时候（如果Cookie没有到期）浏览器会发送该Cookie，服务器验证凭据，因此不用输入用户名和密码就可以让用户登录了。
     
     3.iOS中进行HTTP网络请求Cookie管理主要由两个类负责，一个类是NSHTTPCookieStorage类，一个是NSHTTPCookie类。
     4.🔴两个类中的属性和方法参考官方文档。
     */
}

/// 删除所有cookie
- (IBAction)DeleteAllCokie:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    if (url) {
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
        
        for (int i = 0; i < [cookies count]; i++) {
            NSHTTPCookie *cookie = (NSHTTPCookie *)[cookies objectAtIndex:i];
            NSLog(@"=====%@\n", cookie);
            
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
}

/// 删特定cookie
- (IBAction)DeleteOneCookie:(id)sender {
    NSArray * cookArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    for (NSHTTPCookie*cookie in cookArray)
    {
        if ([cookie.name isEqualToString:@"cookiename"])
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
        
    }
}

/// 删除所有缓存
- (IBAction)DeleteAllHuanCun:(id)sender {
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    NSLog(@"%@", [NSURLCache sharedURLCache]);

}

/// 删除特定缓存
- (IBAction)DeleteOneHuanCun:(id)sender {
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

// Segue不传值的话，不需要写跳转的代码，否则可以在prepareforsegue中传值，
- (IBAction)ToWebView:(id)sender {
    
    NSLog(@"点击跳转");
}


/*
 
 加载某个url的时候添加cookie 如果WKWebView在加载url的时候需要添加cookie，需要先手动获取当前NSHTTPCookieStorage中的所有cookie，然后将cookie放到NSMutableURLRequest请求头中
 
 - (void)loadRequestWithUrlString:(NSString *)urlString {
 
 // 在此处获取返回的cookie
 NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
 
 NSMutableString *cookieValue = [NSMutableString stringWithFormat:@""];
 NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
 
 for (NSHTTPCookie *cookie in [cookieJar cookies]) {
 [cookieDic setObject:cookie.value forKey:cookie.name];
 }
 
 // cookie重复，先放到字典进行去重，再进行拼接
 for (NSString *key in cookieDic) {
 NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
 [cookieValue appendString:appendString];
 }
 
 NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
 [request addValue:cookieValue forHTTPHeaderField:@"Cookie"];
 
 [self loadRequest:request];
 }
 */

@end
