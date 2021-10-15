//
//  HDCrossDissolveFirstViewController.m
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCrossDissolveFirstViewController.h"
#import "HDCrossDissolveSecondViewController.h"
#import "HDCrossDissolveTransitionAnimator.h"
@interface HDCrossDissolveFirstViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation HDCrossDissolveFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.systemPinkColor;
    
    
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:nextButton];
    [nextButton setTitle:@"present with custom transition" forState:UIControlStateNormal];
    [nextButton sizeToFit];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-80);
    }];
    [nextButton addTarget:self action:@selector(presentVC) forControlEvents:UIControlEventTouchUpInside];
    
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
- (void)presentVC{
    HDCrossDissolveSecondViewController *secondVC = [HDCrossDissolveSecondViewController new];
    secondVC.modalPresentationStyle = UIModalPresentationCustom;
    secondVC.transitioningDelegate = self;//设置了代理，切换动画被控制
    [self presentViewController:secondVC animated:YES completion:^{
            
    }];
}

#pragma mark -
#pragma mark UIViewControllerTransitioningDelegate

//| ----------------------------------------------------------------------------
//  The system calls this method on the presented view controller's
//  transitioningDelegate to retrieve（返回） the animator object used for animating
//  the presentation of the incoming view controller.  Your implementation is
//  expected to return an object that conforms to the
//  UIViewControllerAnimatedTransitioning protocol, or nil if the default
//  presentation animation should be used.
//
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [HDCrossDissolveTransitionAnimator new];
}


//| ----------------------------------------------------------------------------
//  The system calls this method on the presented view controller's
//  transitioningDelegate to retrieve the animator object used for animating
//  the dismissal of the presented view controller.  Your implementation is
//  expected to return an object that conforms to the
//  UIViewControllerAnimatedTransitioning protocol, or nil if the default
//  dismissal animation should be used.
//
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [HDCrossDissolveTransitionAnimator new];
}
@end
