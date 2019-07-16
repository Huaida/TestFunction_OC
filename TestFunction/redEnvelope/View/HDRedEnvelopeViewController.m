//
//  HDRedEnvelopeViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDRedEnvelopeViewController.h"
#import "HDRedEnvelopeDataView.h"

@interface HDRedEnvelopeViewController ()

@end

@implementation HDRedEnvelopeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor cyanColor];
    [self customAddSubviews];
}
- (void)customAddSubviews{
    
    HDRedEnvelopeDataView *dataView = [[HDRedEnvelopeDataView alloc] initWithFrame:CGRectMake(0, 100,MZ_SW, 300)];
    dataView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:dataView];
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
