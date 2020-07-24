//
//  HDPageSwitchZHIHUViewController.m
//  TestFunction
//
//  Created by Cage on 2020/7/2.
//  Copyright © 2020 white. All rights reserved.
//

#import "HDPageSwitchZHIHUViewController.h"

@interface HDPageSwitchZHIHUViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIView              *containerView;;
@property (nonatomic, strong) UIScrollView              *scrollview;;
@end

@implementation HDPageSwitchZHIHUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight)];
    [self.view addSubview:self.scrollview];
    self.scrollview.backgroundColor = [UIColor redColor];
    self.scrollview.contentSize = CGSizeMake(kScreenWidth, kScreenHeight+500);
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, 200)];
    [self.view addSubview:_containerView];
    _containerView.backgroundColor = [UIColor whiteColor];
    [self.scrollview addSubview:self.containerView];
    
    self.scrollview.delegate = self;
    
//    [self.scrollview setContentOffset:CGPointMake(0, 189.3) animated:NO];
    self.scrollview.contentOffset = CGPointMake(0, 189.3);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offSetY = scrollView.contentOffset.y;
    
NSLog(@"offSetY -- %f",offSetY);
        
    if (offSetY < -80 && !scrollView.isDragging){
            //            下拉超过40后触发加载
            //            拉取上一个View
//            [self getPreviousNews];
            NSLog(@"%@",@"展示上一个页面");
        }
    
    
    
    //    底部上拉操作
    if (offSetY + kScreenHeight > scrollView.contentSize.height + 60 && !scrollView.isDragging) {
        
//        [self getNextNews];
        NSLog(@"%@",@"展示下一个页面");
    }
    
    //    if (offSetY >= 200) {
    //
    //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    //
    //    }else{
    //
    //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //    }
}



@end
