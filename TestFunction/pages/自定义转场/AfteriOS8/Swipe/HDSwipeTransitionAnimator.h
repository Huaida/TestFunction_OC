//
//  HDSwipeTransitionAnimator.h
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDSwipeTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>
- (instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;

@property (nonatomic, readwrite) UIRectEdge targetEdge;
@end

NS_ASSUME_NONNULL_END
