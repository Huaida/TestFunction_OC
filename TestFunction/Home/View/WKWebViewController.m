//
//  WKWebViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/5/10.
//  Copyright © 2019 white. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewController ()<WKScriptMessageHandler,WKUIDelegate,WKNavigationDelegate>

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addWebView];
}
- (void)addWebView{
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    WKPreferences *preference = [[WKPreferences alloc] init];
    preference.minimumFontSize = 0;
    preference.javaScriptEnabled = YES;
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    configuration.preferences = preference;
    
    WKUserContentController *uccontroller = [[WKUserContentController alloc] init];
//    添加的handler需要手动移除 或者通过中间类弱引用self，起到桥接的作用
    [uccontroller addScriptMessageHandler:self name:@"jsToOcNoPrams"];
    [uccontroller addScriptMessageHandler:self name:@"jsToOcWithPrams"];
    
    configuration.allowsInlineMediaPlayback = YES;
    configuration.allowsPictureInPictureMediaPlayback = YES;
    configuration.applicationNameForUserAgent = @"MyUserAgent";
    
    NSString *jSString = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [uccontroller addUserScript:userScript];

    configuration.userContentController = uccontroller;
    
    WKWebView *web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth,kScreenHeight) configuration:configuration];
    web.backgroundColor = [UIColor blueColor];
    web.UIDelegate = self;
    web.navigationDelegate = self;
    web.allowsBackForwardNavigationGestures = YES;
    
//    打开本地网页
    NSString *path = [[NSBundle mainBundle] pathForResource:@"JStoOC.html" ofType:nil];
    
//    NSString *htmlString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [web loadHTMLString:htmlString baseURL:[NSURL URLWithString:[[NSBundle mainBundle] bundlePath]]];
    NSURL *fileURL = [NSURL fileURLWithPath:path];
    [web loadFileURL:fileURL allowingReadAccessToURL:fileURL];
    
//    NSLog(@"%@----%@--------%@--------%@",path,htmlString,[NSURL URLWithString:[[NSBundle mainBundle] bundlePath]],[[NSBundle mainBundle] bundlePath]);
    
    [self.view addSubview:web];
    
}
// 收到JS代理消息
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
}

@end
