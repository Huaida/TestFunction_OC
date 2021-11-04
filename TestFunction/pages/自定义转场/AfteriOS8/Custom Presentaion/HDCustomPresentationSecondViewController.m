//
//  HDCustomPresentationSecondViewController.m
//  TestFunction
//
//  Created by Cage on 2021/10/29.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCustomPresentationSecondViewController.h"

@interface HDCustomPresentationSecondViewController ()

@end

@implementation HDCustomPresentationSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.cyanColor;

        
    
    //    BackButton
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
