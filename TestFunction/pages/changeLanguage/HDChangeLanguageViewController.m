//
//  HDChangeLanguageViewController.m
//  TestFunction
//
//  Created by Cage  on 2020/3/10.
//  Copyright © 2020 white. All rights reserved.
//

#import "HDChangeLanguageViewController.h"

#import "NSBundle+CLLanguage.h"

@interface HDChangeLanguageViewController ()

@end

@implementation HDChangeLanguageViewController
UILabel *label;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self customAddSubviews];
}

- (void)customAddSubviews{
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    [self.view addSubview:label];
    label.text = NSLocalizedString(@"key", nil);
    
     UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 100, 50)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(changeLanguage) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];

}
-(void)changeLanguage{
    if ([NSBundle isChineseLanguage]) {
        [NSBundle setUserLanguage:@"en"];
    } else {
        [NSBundle setUserLanguage:@"zh-Hans"];
    }
    label.text =NSLocalizedString(@"key", nil);
}
@end
