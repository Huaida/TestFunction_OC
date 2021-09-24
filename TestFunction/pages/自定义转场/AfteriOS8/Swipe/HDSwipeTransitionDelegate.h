//
//  HDSwipeTransitionDelegate.h
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
NS_ASSUME_NONNULL_BEGIN

@interface HDSwipeTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gestureRecognizer;
@property (nonatomic, readwrite) UIRectEdge targetEdge;
@end

NS_ASSUME_NONNULL_END
