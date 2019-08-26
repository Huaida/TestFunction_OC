//
//  HDNavBarCaptureViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNavBarCaptureViewController.h"

@interface HDNavBarCaptureViewController ()
@property (nonatomic, strong) UIImageView *fromFakeImageView;
@property (nonatomic, strong) UIVisualEffectView *fromFakeBar;
@property (nonatomic, strong, readonly) UIColor *hbd_computedBarTintColor;
@property (nonatomic, strong) IBInspectable UIImage *hbd_barImage;
@property (nonatomic, assign) IBInspectable float hbd_barAlpha;
@property (nonatomic, strong, readonly) UIImage *hbd_computedBarImage;
@property (nonatomic, strong) IBInspectable UIColor *hbd_barTintColor;
@end

@implementation HDNavBarCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self showFakeBarFrom:self];
    
}
- (void)showFakeBarFrom:(HDNavBarCaptureViewController *)from {
    //    首先从现有的navigationBar获取图片 做成图片加到vc.view上
   UIImage *fakeImageView = [[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault];
    self.fromFakeImageView.image = [UIImage imageNamed:@"bgImage"];
    self.fromFakeImageView.alpha = 1;
    self.fromFakeImageView.frame = [self fakeBarFrameForViewController:from];
    [from.view addSubview:self.fromFakeImageView];
    //      添加一层bar 放到上面
    self.fromFakeBar.subviews.lastObject.backgroundColor = from.hbd_computedBarTintColor;
    self.fromFakeBar.alpha = from.hbd_barAlpha == 0 || from.hbd_computedBarImage ? 0.01:from.hbd_barAlpha;
    if (from.hbd_barAlpha == 0 || from.hbd_computedBarImage) {
        self.fromFakeBar.subviews.lastObject.alpha = 0.01;
    }
    self.fromFakeBar.frame = [self fakeBarFrameForViewController:from];
    [from.view addSubview:self.fromFakeBar];
//    //    添加一个阴影 放到最上面
//    self.fromFakeShadow.alpha = from.hbd_computedBarShadowAlpha;
//    self.fromFakeShadow.frame = [self fakeShadowFrameWithBarFrame:self.fromFakeBar.frame];
//    [from.view addSubview:self.fromFakeShadow];
}
- (CGRect)fakeBarFrameForViewController:(UIViewController *)vc {
    UIView *back = self.navigationController.navigationBar.subviews[0];
    CGRect frame = [self.navigationController.navigationBar convertRect:back.frame toView:vc.view];
    frame.origin.x = vc.view.frame.origin.x;
    // fix issue for pushed to UIViewController whose root view is UIScrollView.
    if ([vc.view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollview = (UIScrollView *)vc.view;
        // Adapt iPhoneX iPhoneXR
        NSArray *xrs =@[ @812, @896 ];
        BOOL isIPhoneX = [xrs containsObject:@([UIScreen mainScreen].bounds.size.height)];
        if (scrollview.contentOffset.y == 0) {
            frame.origin.y = -(isIPhoneX ? 88 : 64);
        }
    }
    return frame;
}
- (UIVisualEffectView *)fromFakeBar {
    if (!_fromFakeBar) {
        _fromFakeBar = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    }
    return _fromFakeBar;
}
- (UIColor *)hbd_computedBarTintColor {
    if (self.hbd_barImage) {
        return nil;
    }
    UIColor *color = self.hbd_barTintColor;
    if (!color) {
        if ([[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault]) {
            return nil;
        }
        if ([UINavigationBar appearance].barTintColor) {
            color = [UINavigationBar appearance].barTintColor;
        } else {
            color = [UINavigationBar appearance].barStyle == UIBarStyleDefault ? [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:0.8]: [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.729];
        }
    }
    return color;
}

@end