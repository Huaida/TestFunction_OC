//
//  HDNavBarOneViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNavBarFourViewController.h"
#import "WRNavigationBar.h"

@interface HDNavBarFourViewController ()

@end

@implementation HDNavBarFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBaseProperty];
    
}
- (void)setBaseProperty{
    self.view.backgroundColor = [UIColor whiteColor];

    //    把自定义的导航栏view 添加到上层
//    [self.view insertSubview:self.customNavBar aboveSubview:self.view];
//    self.customNavBar.title =  @"自定义导航栏";
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    把自定义的导航栏view 添加到上层
    [self.view insertSubview:self.customNavBar aboveSubview:self.view];
    self.customNavBar.title =  @"自定义导航栏";
}


@end
