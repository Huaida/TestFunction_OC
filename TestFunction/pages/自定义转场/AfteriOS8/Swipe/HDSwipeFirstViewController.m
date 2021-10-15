//
//  HDSwipeFirstViewController.m
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDSwipeFirstViewController.h"
#import "HDSwipeSecondViewController.h"
#import "HDSwipeTransitionDelegate.h"
@interface HDSwipeFirstViewController ()<HDSwipeSecondViewControllerDelegate>
@property (nonatomic, strong) HDSwipeTransitionDelegate *customTransitionDelegate ;
@end

@implementation HDSwipeFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    
//    初始化边缘滑动手势
    UIScreenEdgePanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    interactiveTransitionRecognizer.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
    
//    NextButton
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:nextButton];
    [nextButton setTitle:@"present with custom transition" forState:UIControlStateNormal];
    [nextButton sizeToFit];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-80);
    }];
    [nextButton addTarget:self action:@selector(presentVC:) forControlEvents:UIControlEventTouchUpInside];
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

#pragma mark - 手势触发方法
- (void)interactiveTransitionRecognizerAction:(UIScreenEdgePanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan){
        [ self presentVC:sender];
        
    }
    
    // Remaining cases are handled by the
    // AAPLSwipeTransitionInteractionController.
}
//手势触发收调用方方法
- (void)presentVC:(UIScreenEdgePanGestureRecognizer *)sender{
    HDSwipeSecondViewController *destinationViewController = [HDSwipeSecondViewController new];
    
    // Unlike in the Cross Dissolve demo, we use a separate object as the
    // transition delegate rather then (our)self.  This promotes
    // 'separation of concerns' as AAPLSwipeTransitionDelegate will
    // handle pairing the correct animation controller and interaction
    // controller for the presentation.
    HDSwipeTransitionDelegate *transitionDelegate = self.customTransitionDelegate;
    
    // If this will be an interactive presentation, pass the gesture
    // recognizer along to our AAPLSwipeTransitionDelegate instance
    // so it can return the necessary
    // <UIViewControllerInteractiveTransitioning> for the presentation.
    if ([sender isKindOfClass:UIGestureRecognizer.class])
        transitionDelegate.gestureRecognizer = sender;
    else
        transitionDelegate.gestureRecognizer = nil;
    
    // Set the edge of the screen to present the incoming view controller
    // from.  This will match the edge we configured the
    // UIScreenEdgePanGestureRecognizer with previously.
    //
    // NOTE: We can not retrieve the value of our gesture recognizer's
    //       configured edges because prior to iOS 8.3
    //       UIScreenEdgePanGestureRecognizer would always return
    //       UIRectEdgeNone when querying its edges property.
    transitionDelegate.targetEdge = UIRectEdgeRight;
    
    // Note that the view controller does not hold a strong reference to
    // its transitioningDelegate.  If you instantiate a separate object
    // to be the transitioningDelegate, ensure that you hold a strong
    // reference to that object.
    destinationViewController.transitioningDelegate = transitionDelegate;
    
    // Setting the modalPresentationStyle to FullScreen enables the
    // <ContextTransitioning> to provide more accurate initial and final
    // frames of the participating view controllers.
    destinationViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    destinationViewController.delegate = self;
    
    [self presentViewController:destinationViewController animated:YES completion:^{
            
    }];
}
- (HDSwipeTransitionDelegate *)customTransitionDelegate
{
    if (_customTransitionDelegate == nil)
        _customTransitionDelegate = [[HDSwipeTransitionDelegate alloc] init];
    
    return _customTransitionDelegate;
}
- (void)dismissVC{
    [self dismissViewControllerAnimated:YES completion:^{
            
    }];
}
    
@end
