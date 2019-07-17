//
//  HDNavigationController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/17.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNavigationController.h"

@interface HDNavigationController ()

@end

@implementation HDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseProperty];
}
- (void)setBaseProperty{
    self.view.backgroundColor = [UIColor cyanColor];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
