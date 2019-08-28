//
//  HDShowADViewsViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDShowADViewsViewController.h"
#import "HDADScrollView.h"
#import "HDAutoADScrollView.h"
#import "HDScrollTextView.h"

@interface HDShowADViewsViewController ()

@end

@implementation HDShowADViewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self customAddSubviews];
}
- (void)customAddSubviews{
        HDADScrollView *scrollView = [[HDADScrollView alloc] initWithFrame:CGRectMake(0, 100, MZ_SW, 100)];
        [self.view addSubview:scrollView];
        scrollView.dataArray = @[@"testImage1",@"testImage2",@"testImage3"].mutableCopy;
        scrollView.backgroundColor = [UIColor cyanColor];
    
    HDAutoADScrollView *autoScrollView = [[HDAutoADScrollView alloc] initWithFrame:CGRectMake(0, 300, MZ_SW, 80)];
    [self.view addSubview:autoScrollView];
    autoScrollView.dataArray = @[@"testImage1",@"testImage2",@"testImage3"].mutableCopy;
    autoScrollView.backgroundColor = [UIColor cyanColor];
    
    HDScrollTextView *scrollTextView = [[HDScrollTextView alloc] initWithFrame:CGRectMake(0, 400, MZ_SW, 30)];
    [self.view addSubview:scrollTextView];
    scrollTextView.backgroundColor = MakeColorRGBA(0xFFFF00, 0.3);
    scrollTextView.bulletinString = @"设置了就显示，两个跑马灯之间间隔40px";
    
    
//    self.view.backgroundColor = MakeColorRGB([self integerFromHexString:@"#110000"]);
    
}
- (NSInteger )integerFromHexString:(NSString *)hexString{
    
    NSString *valueString = [hexString substringWithRange:NSMakeRange(1,6)];
    valueString = [NSString stringWithFormat:@"%ld",strtoul([valueString UTF8String],0,16)];
    return [valueString integerValue];
}

@end
