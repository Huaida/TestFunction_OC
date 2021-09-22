//
//  HDNavBarOneViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNavBarThreeViewController.h"
//#import "WRNavigationBar.h"

@interface HDNavBarThreeViewController ()

@end

@implementation HDNavBarThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBaseProperty];
    [self setNavigationBarImage];
}
- (void)setBaseProperty{
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self wr_setNavBarBackgroundAlpha:0];
//    [self wr_setNavBarShadowImageHidden:YES];

}
- (void)setNavigationBarImage{
//        self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"testImageView"];
//    UINavigationBar *bar = self.navigationController.navigationBar;
//    bar.translucent = NO;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"testImageView"] forBarMetrics:UIBarMetricsCompactPrompt];
    
    self.navigationItem.prompt = @"Navigation prompts appear at the top.";
    UIImage *image1 = [UIImage imageNamed:@"testImageView"];
    UIImage *image2 = [UIImage imageNamed:@"bgImage"];
    UIImageView *iView1 = [[UIImageView alloc] initWithImage:image1];
    UIImageView *iView2 = [[UIImageView alloc] initWithImage:image2];
    iView1.frame = CGRectMake(0, 100, 50, 50);
    iView2.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:iView1];
    [self.view addSubview:iView2];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:image1 forBarMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:image2 forBarMetrics:UIBarMetricsCompact];
}
- (UIImage*)imageWithColor:(UIColor*)color

{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 8.0f, 8.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage*theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
    
}


@end
