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
@interface HDSwipeFirstViewController ()
@property (nonatomic, strong) HDSwipeTransitionDelegate *customTransitionDelegate ;
@end

@implementation HDSwipeFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIScreenEdgePanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    interactiveTransitionRecognizer.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
}
- (void)interactiveTransitionRecognizerAction:(UIScreenEdgePanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan){
       [ self presentVC];
        
    }
    
    // Remaining cases are handled by the
    // AAPLSwipeTransitionInteractionController.
}
- (void)presentVC{
    UIViewController *destinationViewController = [HDSwipeSecondViewController new];
    
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
//    if ([sender isKindOfClass:UIGestureRecognizer.class])
//        transitionDelegate.gestureRecognizer = sender;
//    else
//        transitionDelegate.gestureRecognizer = nil;
    
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
    
    [self presentViewController:destinationViewController animated:YES completion:^{
            
    }];
}
- (HDSwipeTransitionDelegate *)customTransitionDelegate
{
    if (_customTransitionDelegate == nil)
        _customTransitionDelegate = [[HDSwipeTransitionDelegate alloc] init];
    
    return _customTransitionDelegate;
}

    
@end
