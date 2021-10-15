//
//  HDSwipeSecondViewController.h
//  TestFunction
//
//  Created by Cage on 2021/9/24.
//  Copyright © 2021 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HDSwipeSecondViewControllerDelegate <NSObject>

-(void)dismissVC;

@end

@interface HDSwipeSecondViewController : UIViewController
@property (nonatomic, weak) id<HDSwipeSecondViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
