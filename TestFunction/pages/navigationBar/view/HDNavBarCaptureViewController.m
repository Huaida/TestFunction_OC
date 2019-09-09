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
@property (nonatomic, strong) UIImageView *fromFakeShadow;
@end

@implementation HDNavBarCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self showFakeBarFrom:self];
    
    [self shorterThanScreenWidth];
    
//    https://www.jianshu.com/p/09988b13e804
//    打印build 号
    NSLog(@"build: %@",[[[NSBundle mainBundle]infoDictionary]valueForKey:@"CFBundleVersion"]);
    
    //这个方法被废弃了
    NSString *urlString = @"http://b.t.zmengzhu.com/#/home/我";
    NSString* encodedString1 = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"encodedString1 %@",encodedString1); //这个方法一般能解决url中含有中文字符的问题，效果同上，但是同时有中文和特殊字符的话，特殊字符会被转换成%234这样的字符串，又出问题了。o(╯□╰)o
    NSString* encodedString2 = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"encodedString2 %@",encodedString2);
    //这个方法能够解决既含有中文又含有特殊字符的解决办法 ^_^
    NSString *encodedString3 = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlString, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
    NSLog(@"encodedString3 %@",encodedString3);
}
- (void)testZhuanYi{
    //    https://www.jianshu.com/p/09988b13e804
    
    //这个方法被废弃了
    NSString *urlString = @"https://www.cnblogs.com/huaida/#/怀达";
    NSString* encodedString1 = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"encodedString1 %@",encodedString1); //这个方法一般能解决url中含有中文字符的问题，效果同上，但是同时有中文和特殊字符的话，特殊字符会被转换成%234这样的字符串，又出问题了。o(╯□╰)o
    NSString* encodedString2 = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"encodedString2 %@",encodedString2);
    //这个方法能够解决既含有中文又含有特殊字符的解决办法 ^_^
    NSString *encodedString3 = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlString, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
    NSLog(@"encodedString3 %@",encodedString3);
}
-(void)shorterThanScreenWidth{
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:22];
    label.backgroundColor = [UIColor yellowColor];
    
    label.text = @"优质输出的前提是要有输出。虽然今天不如人意，但做，就会有收获！望坚持，坚持，坚持！";
    [label sizeToFit];
    label.lineBreakMode = NSLineBreakByWordWrapping;
//    label.frame = CGRectMake(0, 200, MZ_SW, 30);
     NSLog(@"label.frame.size.width %f",label.frame.size.width);
   NSString *fitString = [self string:label.text height:label.frame.size.height FitForWidth:MZ_SW fontSize:22];
    label.text = fitString;
    [label sizeToFit];
    label.center  = self.view.center;
    
}
- (NSString *)string:(NSString *)string height:(CGFloat)height FitForWidth:(CGFloat)width fontSize:(CGFloat)fontSize{
    if (string.length<=1) {
        return nil;
    }
   
    CGRect textRect = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}  context:nil];
    NSString *subString = string;
    while (textRect.size.height>height) {
        subString = [subString substringToIndex:subString.length-1];
         NSLog(@"subString %@",subString);
        textRect = [subString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]}  context:nil];
         NSLog(@"textRect %@",NSStringFromCGRect(textRect));
    }
    return subString;
}
- (void)showFakeBarFrom:(HDNavBarCaptureViewController *)from {
    //    首先从现有的navigationBar获取图片 做成图片加到vc.view上
//   UIImage *fakeImageView = [[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault];
    self.fromFakeImageView = [[UIImageView alloc] init];
    self.fromFakeImageView.image = [UIImage imageNamed:@"bgImage"];
    self.fromFakeImageView.alpha = 1;
    self.fromFakeImageView.frame = [self fakeBarFrameForViewController:from];
    [from.view addSubview:self.fromFakeImageView];
    //      添加一层bar 放到上面
//    最上层的visualEffetSubview 在最上层  设置为绿色
    self.fromFakeBar.subviews.lastObject.backgroundColor = [UIColor greenColor];
    self.fromFakeBar.subviews.lastObject.alpha = 1;
    
    self.fromFakeBar.alpha = 1;
    self.fromFakeBar.frame = [self fakeBarFrameForViewController:from];
     
    [from.view addSubview:self.fromFakeBar];
//    //    添加一个阴影 放到最上面
    self.fromFakeShadow.alpha = 1;
    self.fromFakeShadow.frame = [self fakeShadowFrameWithBarFrame:self.fromFakeBar.frame];
    [from.view addSubview:self.fromFakeShadow];
}
- (CGRect)fakeShadowFrameWithBarFrame:(CGRect)frame {
    return CGRectMake(frame.origin.x, frame.size.height + frame.origin.y - 0.5, frame.size.width, 0.5);
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
//    return frame;
    return CGRectMake(0, 200, MZ_SW, 44);
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
- (UIImageView *)fromFakeShadow {
    if (!_fromFakeShadow) {
        _fromFakeShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"testImage1"]];
        _fromFakeShadow.backgroundColor = [UIColor yellowColor];
    }
    return _fromFakeShadow;
}
@end
