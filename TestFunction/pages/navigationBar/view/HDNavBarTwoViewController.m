//
//  HDNavBarOneViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNavBarTwoViewController.h"
//#import "WRNavigationBar.h"

@interface HDNavBarTwoViewController ()

@end

@implementation HDNavBarTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseProperty];
}
- (void)setBaseProperty{
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self wr_setNavBarBackgroundAlpha:0];
//    [self wr_setNavBarBarTintColor:[UIColor redColor]];
//    [self wr_setNavBarShadowImageHidden:YES];
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
