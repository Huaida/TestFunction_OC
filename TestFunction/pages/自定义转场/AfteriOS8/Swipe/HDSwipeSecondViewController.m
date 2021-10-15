//
//  HDSwipeSecondViewController.m
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDSwipeSecondViewController.h"
#import "HDSwipeTransitionDelegate.h"

@interface HDSwipeSecondViewController ()

@end

@implementation HDSwipeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // This gesture recognizer could be defined in the storyboard but is
    // instead created in code for clarity.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:backButton];
    [backButton setTitle:@"BACk" forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        
    }];
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // This gesture recognizer could be defined in the storyboard but is
    // instead created in code for clarity.
    UIScreenEdgePanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    interactiveTransitionRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
}

- (void)back:(UIScreenEdgePanGestureRecognizer *)sender{
//    [self.delegate dismissVC];
    if ([self.transitioningDelegate isKindOfClass:HDSwipeTransitionDelegate.class])
    {
        HDSwipeTransitionDelegate *transitionDelegate = self.transitioningDelegate;
        
        // If this will be an interactive presentation, pass the gesture
        // recognizer along to our AAPLSwipeTransitionDelegate instance
        // so it can return the necessary
        // <UIViewControllerInteractiveTransitioning> for the presentation.
        if ([sender isKindOfClass:UIGestureRecognizer.class])
            transitionDelegate.gestureRecognizer = sender;
        else
            transitionDelegate.gestureRecognizer = nil;
        
        // Set the edge of the screen to dismiss this view controller
        // from.  This will match the edge we configured the
        // UIScreenEdgePanGestureRecognizer with previously.
        //
        // NOTE: We can not retrieve the value of our gesture recognizer's
        //       configured edges because prior to iOS 8.3
        //       UIScreenEdgePanGestureRecognizer would always return
        //       UIRectEdgeNone when querying its edges property.
        transitionDelegate.targetEdge = UIRectEdgeLeft;
    }
    [self dismissViewControllerAnimated:YES completion:^{
            
    }];
}
- (IBAction)interactiveTransitionRecognizerAction:(UIScreenEdgePanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        // "BackToFirstViewController" is the identifier of the unwind segue
        // back to AAPLSwipeFirstViewController.  Triggering it will dismiss
        // this view controller.
//        [self performSegueWithIdentifier:@"BackToFirstViewController" sender:sender];
        [self back:sender];
    }
}

@end
