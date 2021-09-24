//
//  HDCrossDissolveSecondViewController.m
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCrossDissolveSecondViewController.h"

@interface HDCrossDissolveSecondViewController ()

@end

@implementation HDCrossDissolveSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.purpleColor;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:backButton];
    [backButton setTitle:@"BACk" forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        
    }];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}
- (void)back{
    [self dismissViewControllerAnimated:YES
    completion:^{
        
    }];
}

@end
