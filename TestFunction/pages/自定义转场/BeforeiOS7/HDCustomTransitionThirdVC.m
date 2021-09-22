//
//  HDCustomTransitionThirdVC.m
//  TestFunction
//
//  Created by Cage on 2021/9/17.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDCustomTransitionThirdVC.h"

@interface HDCustomTransitionThirdVC ()

@end

@implementation HDCustomTransitionThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self customAddSubviews];
}

-(void)customAddSubviews{
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:clickButton];
    clickButton.frame = CGRectMake(200, 200, 100, 100);
    clickButton.backgroundColor = [UIColor yellowColor];
    [clickButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];

    
}
-(void)buttonClick{
    
    NSLog(@"%s",__func__);
    [[NSNotificationCenter defaultCenter] postNotificationName:kVCTransitionNotification object:@(3)];
}
- (void)willMoveToParentViewController:(UIViewController *)parent{
    
}
@end
