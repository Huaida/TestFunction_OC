//
//  HDCustomPresentationController.m
//  TestFunction
//
//  Created by Cage on 2021/10/29.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCustomPresentationController.h"
@interface HDCustomPresentationController()<UIViewControllerAnimatedTransitioning>
@property (nonatomic, strong) UIView *dimmingView;//变暗的view
@property (nonatomic, strong) UIView *presentationWrappingView;
@end

@implementation HDCustomPresentationController


//| ----------------------------------------------------------------------------
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    
    if (self) {
        // The presented view controller must have a modalPresentationStyle
        // of UIModalPresentationCustom for a custom presentation controller
        // to be used.
//        给被呈现的VC设置呈现样式属性
        presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    }
    
    return self;
}


//| ----------------------------------------------------------------------------
- (UIView*)presentedView
{
//    自定义的外层view  shadow
    // Return the wrapping view created in -presentationTransitionWillBegin.
    return self.presentationWrappingView;
}


//| ----------------------------------------------------------------------------
//  This is one of the first methods invoked on the presentation controller
//  at the start of a presentation.  By the time this method is called,
//  the containerView has been created and the view hierarchy set up for the
//  presentation.  However, the -presentedView has not yet been retrieved.
//
- (void)presentationTransitionWillBegin
{
    // The default implementation of -presentedView returns
    // self.presentedViewController.view.
//    返回被呈现VC 的View
    UIView *presentedViewControllerView = [super presentedView];
    
    // Wrap the presented view controller's view in an intermediate hierarchy
    // that applies a shadow and rounded corners to the top-left and top-right
    // edges.  The final effect is built using three intermediate views.
    //
    // presentationWrapperView              <- shadow
    //   |- presentationRoundedCornerView   <- rounded corners (masksToBounds)
    //        |- presentedViewControllerWrapperView
    //             |- presentedViewControllerView (presentedViewController.view) // 这个是最上层的
    //
    // SEE ALSO: The note in AAPLCustomPresentationSecondViewController.m.
    {
//        创建阴影
        UIView *presentationWrapperView = [[UIView alloc] initWithFrame:self.frameOfPresentedViewInContainerView];
        presentationWrapperView.layer.shadowOpacity = 0.44f;
        presentationWrapperView.layer.shadowRadius = 13.f;
        presentationWrapperView.layer.shadowOffset = CGSizeMake(0, -6.f);
        self.presentationWrappingView = presentationWrapperView;
        
        // presentationRoundedCornerView is CORNER_RADIUS points taller than the
        // height of the presented view controller's view.  This is because
        // the cornerRadius is applied to all corners of the view.  Since the
        // effect calls for only the top two corners to be rounded we size
        // the view such that the bottom CORNER_RADIUS points lie below
        // the bottom edge of the screen. 为了将四个圆角中的，下面两个角遮住，这个view会高一点
        UIView *presentationRoundedCornerView = [[UIView alloc] initWithFrame:UIEdgeInsetsInsetRect(presentationWrapperView.bounds, UIEdgeInsetsMake(0, 0, -CORNER_RADIUS, 0))];
        presentationRoundedCornerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        presentationRoundedCornerView.layer.cornerRadius = CORNER_RADIUS;
        presentationRoundedCornerView.layer.masksToBounds = YES;
        
        // To undo the extra height added to presentationRoundedCornerView,
        // presentedViewControllerWrapperView is inset by CORNER_RADIUS points.
        // This also matches the size of presentedViewControllerWrapperView's
        // bounds to the size of -frameOfPresentedViewInContainerView.
        UIView *presentedViewControllerWrapperView = [[UIView alloc] initWithFrame:UIEdgeInsetsInsetRect(presentationRoundedCornerView.bounds, UIEdgeInsetsMake(0, 0, CORNER_RADIUS, 0))];
        presentedViewControllerWrapperView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        // Add presentedViewControllerView -> presentedViewControllerWrapperView.
        presentedViewControllerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        presentedViewControllerView.frame = presentedViewControllerWrapperView.bounds;
        [presentedViewControllerWrapperView addSubview:presentedViewControllerView];
        
        // Add presentedViewControllerWrapperView -> presentationRoundedCornerView.
        [presentationRoundedCornerView addSubview:presentedViewControllerWrapperView];
        
        // Add presentationRoundedCornerView -> presentationWrapperView.
        [presentationWrapperView addSubview:presentationRoundedCornerView];
    }
    
    // Add a dimming view behind presentationWrapperView.  self.presentedView
    // is added later (by the animator) so any views added here will be
    // appear behind the -presentedView.
    {
        UIView *dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        dimmingView.backgroundColor = [UIColor blackColor];
        dimmingView.opaque = NO;
        dimmingView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [dimmingView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewTapped:)]];
        self.dimmingView = dimmingView;
        [self.containerView addSubview:dimmingView];
        
        // Get the transition coordinator[协调器] for the presentation so we can
        // fade in the dimmingView alongside the presentation animation.
        id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
        
        self.dimmingView.alpha = 0.f;
        [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            self.dimmingView.alpha = 0.5f;
        } completion:NULL];
    }
}


//| ----------------------------------------------------------------------------
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    // The value of the 'completed' argument is the same value passed to the
    // -completeTransition: method by the animator.  It may
    // be NO in the case of a cancelled interactive transition.
    if (completed == NO)
    {
        // The system removes the presented view controller's view from its
        // superview and disposes of the containerView.  This implicitly
        // removes the views created in -presentationTransitionWillBegin: from
        // the view hierarchy.  However, we still need to relinquish our strong
        // references to those view.
        self.presentationWrappingView = nil;
        self.dimmingView = nil;
    }
}


//| ----------------------------------------------------------------------------
- (void)dismissalTransitionWillBegin
{
    // Get the transition coordinator for the dismissal so we can
    // fade out the dimmingView alongside the dismissal animation.
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
    
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 0.f;
    } completion:NULL];
}


//| ----------------------------------------------------------------------------
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    // The value of the 'completed' argument is the same value passed to the
    // -completeTransition: method by the animator.  It may
    // be NO in the case of a cancelled interactive transition.
    if (completed == YES)
    {
        // The system removes the presented view controller's view from its
        // superview and disposes of the containerView.  This implicitly
        // removes the views created in -presentationTransitionWillBegin: from
        // the view hierarchy.  However, we still need to relinquish our strong
        // references to those view.
        self.presentationWrappingView = nil;
        self.dimmingView = nil;
    }
}

#pragma mark -
#pragma mark Layout

//| ----------------------------------------------------------------------------
//  This method is invoked whenever the presentedViewController's
//  preferredContentSize property changes.  It is also invoked just before the
//  presentation transition begins (prior to -presentationTransitionWillBegin).
//
- (void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container
{
    [super preferredContentSizeDidChangeForChildContentContainer:container];
    
    if (container == self.presentedViewController)
        [self.containerView setNeedsLayout];
}


//| ----------------------------------------------------------------------------
//  When the presentation controller receives a
//  -viewWillTransitionToSize:withTransitionCoordinator: message it calls this
//  method to retrieve the new size for the presentedViewController's view.
//  The presentation controller then sends a
//  -viewWillTransitionToSize:withTransitionCoordinator: message to the
//  presentedViewController with this size as the first argument.
//
//  Note that it is up to the presentation controller to adjust the frame
//  of the presented view controller's view to match this promised size.
//  We do this in -containerViewWillLayoutSubviews.
//
- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
{
    if (container == self.presentedViewController)
        return ((UIViewController*)container).preferredContentSize;
    else
        return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}


//| ----------------------------------------------------------------------------
- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect containerViewBounds = self.containerView.bounds;
    CGSize presentedViewContentSize = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerViewBounds.size];
    
    // The presented view extends presentedViewContentSize.height points from
    // the bottom edge of the screen.
    CGRect presentedViewControllerFrame = containerViewBounds;
    presentedViewControllerFrame.size.height = presentedViewContentSize.height;
    presentedViewControllerFrame.origin.y = CGRectGetMaxY(containerViewBounds) - presentedViewContentSize.height;
    return presentedViewControllerFrame;
}


//| ----------------------------------------------------------------------------
//  This method is similar to the -viewWillLayoutSubviews method in
//  UIViewController.  It allows the presentation controller to alter the
//  layout of any custom views it manages.
//
- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
    
    self.dimmingView.frame = self.containerView.bounds;
    self.presentationWrappingView.frame = self.frameOfPresentedViewInContainerView;
}

#pragma mark -
#pragma mark Tap Gesture Recognizer

//| ----------------------------------------------------------------------------
//  IBAction for the tap gesture recognizer added to the dimmingView.
//  Dismisses the presented view controller.
//
- (IBAction)dimmingViewTapped:(UITapGestureRecognizer*)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark -
#pragma mark UIViewControllerAnimatedTransitioning

//| ----------------------------------------------------------------------------
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return [transitionContext isAnimated] ? 0.35 : 0;
}


//| ----------------------------------------------------------------------------
//  The presentation animation is tightly integrated with the overall
//  presentation so it makes the most sense to implement
//  <UIViewControllerAnimatedTransitioning> in the presentation controller
//  rather than in a separate object.
//
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    
    // For a Presentation:
    //      fromView = The presenting view.
    //      toView   = The presented view.
    // For a Dismissal:
    //      fromView = The presented view.
    //      toView   = The presenting view.
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    // If NO is returned from -shouldRemovePresentersView, the view associated
    // with UITransitionContextFromViewKey is nil during presentation.  This
    // intended to be a hint that your animator should NOT be manipulating the
    // presenting view controller's view.  For a dismissal, the -presentedView
    // is returned.
    //
    // Why not allow the animator manipulate the presenting view controller's
    // view at all times?  First of all, if the presenting view controller's
    // view is going to stay visible after the animation finishes during the
    // whole presentation life cycle there is no need to animate it at all — it
    // just stays where it is.  Second, if the ownership for that view
    // controller is transferred to the presentation controller, the
    // presentation controller will most likely not know how to layout that
    // view controller's view when needed, for example when the orientation
    // changes, but the original owner of the presenting view controller does.
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    BOOL isPresenting = (fromViewController == self.presentingViewController);
    
    // This will be the current frame of fromViewController.view.
    CGRect __unused fromViewInitialFrame = [transitionContext initialFrameForViewController:fromViewController];
    // For a presentation which removes the presenter's view, this will be
    // CGRectZero.  Otherwise, the current frame of fromViewController.view.
    CGRect fromViewFinalFrame = [transitionContext finalFrameForViewController:fromViewController];
    // This will be CGRectZero.
    CGRect toViewInitialFrame = [transitionContext initialFrameForViewController:toViewController];
    // For a presentation, this will be the value returned from the
    // presentation controller's -frameOfPresentedViewInContainerView method.
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    // We are responsible for adding the incoming view to the containerView
    // for the presentation (will have no effect on dismissal because the
    // presenting view controller's view was not removed).
    [containerView addSubview:toView];
    
    if (isPresenting) {
        toViewInitialFrame.origin = CGPointMake(CGRectGetMinX(containerView.bounds), CGRectGetMaxY(containerView.bounds));
        toViewInitialFrame.size = toViewFinalFrame.size;
        toView.frame = toViewInitialFrame;
    } else {
        // Because our presentation wraps the presented view controller's view
        // in an intermediate view hierarchy, it is more accurate to rely
        // on the current frame of fromView than fromViewInitialFrame as the
        // initial frame (though in this example they will be the same).
        fromViewFinalFrame = CGRectOffset(fromView.frame, 0, CGRectGetHeight(fromView.frame));
    }
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:transitionDuration animations:^{
        if (isPresenting)
            toView.frame = toViewFinalFrame;
        else
            fromView.frame = fromViewFinalFrame;
        
    } completion:^(BOOL finished) {
        // When we complete, tell the transition context
        // passing along the BOOL that indicates whether the transition
        // finished or not.
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}

#pragma mark -
#pragma mark UIViewControllerTransitioningDelegate 过度代理
//谁是动画主管
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    NSAssert(self.presentedViewController == presented, @"You didn't initialize %@ with the correct presentedViewController.  Expected %@, got %@.",
             self, presented, self.presentedViewController);
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}
@end
