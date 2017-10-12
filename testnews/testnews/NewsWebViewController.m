//
//  NewsWebViewController.m
//  testnews
//
//  Created by Way_Lone on 2017/10/12.
//  Copyright © 2017年 waynehu. All rights reserved.
//

#import "NewsWebViewController.h"
#import <WebKit/WebKit.h>

@interface NewsWebViewController ()<WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *webView;
@property(nonatomic,strong) NSString *hidenJs;
@property(nonatomic,strong) UIActivityIndicatorView *indicator;
@property(nonatomic,strong) NSURLRequest *request;
@end

@implementation NewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    NSString *url = @"http://mini.eastday.com/mobile/171012154224547.html";
    NSString *jsPath = [[NSBundle mainBundle]pathForResource:@"hidden.js" ofType:nil];
    NSString *jqueryPath = [[NSBundle mainBundle]pathForResource:@"jquery.min.js" ofType:nil];
    
//    self.hidenJs = [[NSString stringWithContentsOfFile:jqueryPath encoding:NSUTF8StringEncoding error:nil] stringByAppendingString:[NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil]];
    self.hidenJs = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
    self.request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0f];
    [self.webView loadRequest:self.request];
    //[self.webView evaluateJavaScript:js completionHandler:nil];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    self.webView.alpha = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //indicator
    self.indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.center = self.view.center;
    CGAffineTransform transform = CGAffineTransformMakeScale(2.7f, 2.7f);
    _indicator.transform = transform;
    [self.view addSubview:_indicator];
    [_indicator startAnimating];
    // Do any additional setup after loading the view.
}

-(void)dealloc{
    NSLog(@"newswebviewController dealloc");
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self runJsCode];

    
}
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
}
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    if (self.webView.alpha>0.8) {
        [self.webView stopLoading];
    }
    
}
-(void)runJsCode{
    NSString *js = self.hidenJs;
    __weak typeof(self) safe = self;
    [self.webView evaluateJavaScript:js completionHandler:^(id _Nullable i, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.3 animations:^{
                safe.webView.alpha = 1;
                
            }];
            [safe.indicator stopAnimating];
        });
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
