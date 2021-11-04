//
//  HDCustomPresentationFirstViewController.m
//  TestFunction
//
//  Created by Cage on 2021/10/28.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCustomPresentationFirstViewController.h"
#import "HDCustomPresentationController.h"
#import "HDCustomPresentationSecondViewController.h"
@interface HDCustomPresentationFirstViewController ()

@end

@implementation HDCustomPresentationFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
//    self.modalPresentationStyle = UIModalPresentationCustom;
//    self.preferredContentSize = CGSizeMake(kScreenWidth, 300);
    
    //    NextButton
        UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:nextButton];
        [nextButton setTitle:@"present with custom transition" forState:UIControlStateNormal];
        [nextButton sizeToFit];
        [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).offset(-80);
        }];
        [nextButton addTarget:self action:@selector(presentVC) forControlEvents:UIControlEventTouchUpInside];
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
- (void)presentVC{
    HDCustomPresentationSecondViewController *secondVC = [HDCustomPresentationSecondViewController new];
    
    
    HDCustomPresentationController *presentationController = [[HDCustomPresentationController alloc] initWithPresentedViewController:secondVC presentingViewController:self];
    secondVC.modalPresentationStyle =
    UIModalPresentationCustom;
    secondVC.transitioningDelegate = presentationController;
    
    
    [self presentViewController:secondVC animated:YES completion:^{
            
    }];
}
- (void)back{
    [self dismissViewControllerAnimated:YES
    completion:^{
        
    }];
}

@end
