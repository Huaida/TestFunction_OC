//
//  HDViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/4/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDViewController.h"
#import "HDViewController+Logging.h"
#import <objc/runtime.h>
#import <WebKit/WebKit.h>


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface HDViewController ()<WKScriptMessageHandler,WKUIDelegate>

@end

@implementation HDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.view.backgroundColor = [UIColor cyanColor];
    
// 添加WebKit
//    [self addWebView];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    _categoryName = @"sssss";
//    self.categoryName = @"categorName amazing!";
//     NSLog(@"%@",self.categoryName);
}
- (void)addWebView{
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = [[WKUserContentController alloc] init];
    [configuration.userContentController addScriptMessageHandler:self name:@"scan"];
    
    WKWebView *wk = [[WKWebView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight) configuration:configuration];
    wk.UIDelegate = self;
}
#pragma mark  - handler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"scan"]) {
        
    }
}

- (void)viewDidLayoutSubviews{
//     如果直接使用函数名
    swizzleMethodq([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
}
    
- (void)swizzled_viewDidAppear:(BOOL)animated
{
    // call original implementation
    [self swizzled_viewDidAppear:animated];
    
    // Logging
    NSLog(@"%@", NSStringFromClass([self class]));
}

void swizzleMethodq(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    // 判断originalSelector是否已经指向了交换方法
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    // 如果originalSelector指向成功，那么在重新切换swizzledSelector就可以了 否则两个方法交换下 避免重复交换
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
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
