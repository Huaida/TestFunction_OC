//
//  HDShowADViewsViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDShowADViewsViewController.h"
#import "HDADScrollView.h"

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
        HDADScrollView *scrollView = [[HDADScrollView alloc] initWithFrame:CGRectMake(0, 0, MZ_SW, MZTotalScreenHeight)];
        [self.view addSubview:scrollView];
        scrollView.dataArray = @[@"名片背景3",@"名片背景3",@"名片背景3"].mutableCopy;
        scrollView.backgroundColor = [UIColor cyanColor];
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
