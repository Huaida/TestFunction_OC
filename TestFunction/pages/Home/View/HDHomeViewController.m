//
//  HDHomeViewController.m
//  TestFunction
//
//  Created by 怀达 on 2018/12/14.
//  Copyright © 2018年 white. All rights reserved.
// 01
///2
///3
///

#import "HDHomeViewController.h"
//#import "Person.h"
#import "SubView.h"
#import "Son.h"
#import "Person+Cat.h"
#import <objc/runtime.h>
#import <objc/NSObjCRuntime.h>
#import "HDCheckArray.h"
#import "HDViewController.h"
#import "TestOneModel.h"
#import <YYKit/YYKit.h>
#import "NetworkTool.h"
#import "WKWebViewController.h"
#import "HDNetworkTool.h"
#import <lottie-ios/Lottie/Lottie.h>
//#import "HDBarrageSwitch.h"
#import "NSMutableArray+SafeForData.h"
#import "HDHomeTableView.h"
#import "HDImageView.h"
#import "HDHomePresenter.h"
//#import "HDADScrollView.h"
#import "HDTestView.h"
#import "UIImage+drawCircle.h"
#import "UIView+drawCornerRadius.h"

// test
///
///1
///2
///3
///4
///5
///6-fea_01 6-fea_02
///7

#define MakeColorRGB(hex)  ([UIColor colorWithRed:((hex>>16)&0xff)/255.0 green:((hex>>8)&0xff)/255.0 blue:(hex&0xff)/255.0 alpha:1.0])

typedef void (^someBlock)(void);

@interface HDHomeViewController ()<UIGestureRecognizerDelegate,HDHomePresenterProtocol,HDHomeTableViewProtocol>
@property (nonatomic, copy) someBlock myBlock;
@property (nonatomic, strong) Person *p;
@property (nonatomic, strong) Son *son;
@property (nonatomic, strong) NSMutableArray *mArray;
@property (nonatomic, weak) NSString *bString;
@property (nonatomic, strong) NSMutableString *mString;
@property (nonatomic, strong) TestOneModel *modelOne;
@property (nonatomic, strong) UISwitch *mySwitch;
@property (nonatomic, strong) UILabel *sLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic ,strong) HDHomeTableView *tableView;
@property (nonatomic ,strong) HDImageView *imageView;
@property (nonatomic ,strong) HDHomePresenter *presenter;
@end


@implementation HDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBaseProperty];
    
    self.presenter = [[HDHomePresenter alloc] initWithDelegate:self];
    [self customAddSubviews];
    [self.presenter presenterLoadData];
    
     

//    模拟点击第N个cell
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:15 inSection:0];
//
//        [self.tableView tableView:self.tableView didSelectRowAtIndexPath:indexPath];
//
//    });

    
    
    
    
    
    CFAbsoluteTime first = CFAbsoluteTimeGetCurrent();
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self testKVCFunction];
//    [self testAssignFunction];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        NSLog(@"%@",[self.p valueForKey:@"_age"]);
//    });
//    [self testBlockFunction:10];
//    [[NSRunLoop currentRunLoop] runMode:NSRunLoopCommonModes beforeDate:[NSDate date]];
//     NSLog(@"%@",[[NSRunLoop currentRunLoop] currentMode]);
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testKVCFunction) userInfo:nil repeats:YES];
//    [self sendMessageToNilObject];
//    [self sort];
//    [self testGCD1];
//    [self testResponderChain];
//    [self testKVO];
//    [self testString];
//    [self testRunloop];
//    [self testLocalVariable];
//    [self testForLoop];
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    [cell.contentView systemLayoutSizeFittingSize:CGSizeZero];
//    [self testCategory];
//    [self addCornerImage];
//    [self checkMArray];
//    [self testNSCopying];
//    [self testIncreasFunction];
//    [self testYYModel];
//    [self testSingleton];
//    [self testScope]; ，
//    [self getHTMLString];
//    [self testHash];
//    [self testNetworkTool];
//    [self testLottie];
//    [self testLabel];
//    [self testButtonLabel];
//    [self testSwitch];
//    [self testSubClassFunction];
//    [self testSafeMutabelArray];
//    [self testButton];
//    [self testDic];
//    [self testFirstresponderBottomValue];
//    [self testAlertView];
//    [self testVersion];
//    [self testArray];
//    [self testMutabelArray];
//    测试github连接
//    [self testLabel];
//    [self testScrollView];
//    [self testNavigationBar];
//    [self testImage];
//    [self testSafeArea];
//    [self testNOEmplementationFunction];
//    [self testADScrollView];
//    [self testLabelheight];
//    [self testNil];
//    [self testSubThreadFunction];
//    [self  testStandardNumber];
//    [self testOFFScreenRedering];
//    [self testSubThreadDrawCircle];
    [self testDifferentTarget];
    
    
    
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent() - first;
        NSLog(@"testSubThreadDrawCircle：%f ms",time*1000.0);
}
- (void)testDifferentTarget{
    HDTestView *testView =[[HDTestView alloc] initWithFrame:CGRectMake(50, 100, 500, 250)];
        [self.view addSubview:testView];
    
//    testView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"testImage2"]];
    
#if TATGET_MAIN
    testView.backgroundColor = UIColor.blueColor;
#endif
    
#if TATGET_COPY
    testView.backgroundColor = UIColor.yellowColor;
#endif
    
}
- (void)testSubThreadDrawCircle{
    
//    遮罩还是会触发离屏渲染
//        UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
//        [self.view addSubview:testButton];
//    // 通过图片生成遮罩，
//    UIImage *maskImage = [UIImage imageNamed:@"testImage2"];
//    [testButton setImage:maskImage forState:UIControlStateNormal];
//
//    //通过贝塞尔曲线生成
//    CAShapeLayer *mask = [CAShapeLayer new];
//    mask.path = [UIBezierPath bezierPathWithOvalInRect:testButton.bounds].CGPath;
//    testButton.layer.mask = mask;
    
//    子线程处理

    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
    [self.view addSubview:testButton];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [UIImage imageNamed:@"testImage2"];
        image = [image hd_drawRectWithRoundedCorner:50];
        dispatch_async(dispatch_get_main_queue(), ^{
            [testButton setImage:image forState:UIControlStateNormal ];
        });
    });
 
    
    
    
    
//    UIButton *testButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
//    [self.view addSubview:testButton];
//    UIImage *image = [UIImage imageNamed:@"testImage2"];
//    [testButton setImage:image forState:UIControlStateNormal ];
//    testButton.layer.masksToBounds = YES;
//    testButton.layer.cornerRadius = 50;
        
}
- (void)testOFFScreenRedering{
    CFAbsoluteTime first = CFAbsoluteTimeGetCurrent();
    
//    UIView设置圆角不会触发离屏渲染 仅仅设置testView.layer.cornerRadius = 18;就可以了，此时layer的content是透明的，CornerRadius能修改background和border.即使加了testView.layer.masksToBounds = YES;也不会
//    view添加子View后就会触发父View的离屏渲染
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
    testView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"testImage2"]];
    [self.view addSubview:testView];
//    testView.alpha = 0.8;
    //    测试子view 会触发父View的离屏渲染
//    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    [testView addSubview:subView];
//    subView.backgroundColor = [UIColor redColor];
    //    测试组透明  父View设置透明度后，会触发
//    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    [testView addSubview:subView];
//    subView.backgroundColor = [UIColor redColor];
//    毛玻璃效果  会触发离屏渲染
    //iOS 8.0
//    * * 模糊效果的三种风格
//      *
//      *  @param UIBlurEffectStyle
//      *
//      * UIBlurEffectStyleExtraLight,  //高亮
//      * UIBlurEffectStyleLight,       //亮
//      * UIBlurEffectStyleDark         //暗
//    * *
    UIBlurEffect *blurEffect =[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];

    UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:blurEffect];

    effectView.frame = CGRectMake(testView.frame.size.width/2,0,
                                  testView.frame.size.width/2, testView.frame.size.height);

    [testView addSubview:effectView];
    
    
    
    //   iOS 9.0 之后UIImageView里png（测试发现JPEG也可以）图片设置圆角不会触发离屏渲染了,但是加了backgroundColor就会触发（同时设置） UIImageView设置圆角也不会触发离屏渲染 需要设置testView.layer.cornerRadius = 18;testView.layer.masksToBounds = YES; 单独设置一个CornerRadius是无效的。
//    UIImageView *testView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
//    [testView setImage:[UIImage imageNamed:@"testImage2"]];
////    testView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:testView];
    

    
//    UIButton 是会触发离屏渲染的  只设置一个属性是无效的
//    UIButton *testView = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
//    [testView setImage:[UIImage imageNamed:@"testImage2"] forState:UIControlStateNormal ];
//    [self.view addSubview:testView];
    
    //    UILabel设置圆角也不会触发离屏渲染。 UILabel, UITextField, UITextView。其中 UITextField 类自带圆角风格的外型，UILabel 和 UITextView 要想显示圆角需要表现出与周围不同的背景色才行。想要在 UILabel 和 UITextView 上实现低成本的圆角(不触发离屏渲染)，需要保证 layer 的 contents 呈现透明的背景色，文本视图类的 layer 的 contents 默认是透明的(字符就在这个透明的环境里绘制、显示)，此时只需要设置 layer 的 backgroundColor ，再加上 cornerRadius 就可以搞定了。不过 UILabel 上设置 backgroundColor 的行为被更改了，不再是设定 layer 的背景色而是为 contents 设置背景色，UITextView 则没有改变这一点，所以在 UILabel 上实现圆角要这么做：testView.layer.cornerRadius = 18;testView.layer.backgroundColor = [UIColor grayColor].CGColor;
//    UILabel *testView = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 150)];
//    testView.backgroundColor = [UIColor grayColor];// 这里设置的是content层的backgroundColor
//    [self.view addSubview:testView];
//    testView.text = @"134567890";
    
//    testView.layer.cornerRadius = 18;
////    testView.layer.backgroundColor = [UIColor grayColor].CGColor;
//    testView.layer.masksToBounds = YES;
    
    
//    总结:
//    测试发现，只有Button设置圆角才会触发离屏渲染。
    
    
    
    
    
//    遮罩view
//    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 100)];
//    maskView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"一路發"]];
//    [testView addSubview:maskView];
//    testView.maskView = maskView;
    
//    光栅化
//    testView.layer.shouldRasterize = YES;
//    testView.layer.rasterizationScale = [UIScreen mainScreen].scale;
//    阴影
//    testView.layer.shadowOpacity = 1;
//    testView.layer.shadowColor = [UIColor redColor].CGColor;
//    testView.layer.shadowOffset = CGSizeMake(2, 20);
// edge antialiasing（抗锯齿）
//    testView.layer.allowsEdgeAntialiasing = YES;
    
//     group opacity（不透明）
    
    
//    HDTestView *testView = [[HDTestView alloc] initWithFrame:CGRectMake(50, 100, 500, 250)];
//    testView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"testImage2"]];
//    [self.view addSubview:testView];
    
    
    
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent() - first;
        NSLog(@"maskView：%f ms",time*1000.0);
}
- (void)testStandardNumber{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 1000, 100)];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    CFAbsoluteTime first = CFAbsoluteTimeGetCurrent();
//    label.text = [@"89988883483858.8858385" bbx_standardNumberString];
//    label.text = @"89988883483858.8858385";
        label.text =[self toStandardString:@"-0.8858385"] ;
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent() - first;
        NSLog(@"Label赋值耗时：%f ms",time*1000.0);
}
/// 加千分位符
/// @param string 数字
-(NSString *)toStandardString:(NSString *)string{
    if (string == nil || string.length == 0) {
        return @"0";
    }
    NSString *error = @"error number";
    NSString *result ;
    if ([string containsString:@"-"]) {
        string = [string substringFromIndex:1];
        if ([string containsString:@"."]) {
    //        小数
            NSArray *comp = [string componentsSeparatedByString:@"."];
            if (comp.count != 2) {
                return error;
            }
            NSString *pre = [self integerToFormat:(NSString *)[comp firstObject]];
            result = [NSString stringWithFormat:@"-%@.%@",pre,[comp lastObject]];
        }else{
    //        整数
            result = [NSString stringWithFormat:@"-%@",[self integerToFormat:string]];
        }
    }else{
        if ([string containsString:@"."]) {
    //        小数
            NSArray *comp = [string componentsSeparatedByString:@"."];
            if (comp.count != 2) {
                return error;
            }
            NSString *pre = [self integerToFormat:(NSString *)[comp firstObject]];
            
            result = [NSString stringWithFormat:@"%@.%@",pre,[comp lastObject]];
        }else{
    //        整数
           
            result = [self integerToFormat:string];
        }
    }
    
    return result;
}
-(NSString *)integerToFormat:(NSString *)string{
    NSMutableString *pre = [NSMutableString stringWithFormat:@"%@",string];
//        12 345 678
    NSUInteger length = pre.length;
    NSInteger pointCount = length/3;
    if (pointCount > 0 && length%3 == 0) {
        pointCount -= 1;
    }
    NSUInteger insertIndex = length - 3;
    while (pointCount > 0) {
        [pre insertString:@"," atIndex:insertIndex];
        insertIndex -= 3;
        pointCount --;
    }
    return [pre copy];
}
- (void)testSubThreadFunction{
    
   
}

- (void)testNil{
    
//    NSMutableArray *mArray = [NSMutableArray arrayWithObject:@[@1,[NSNull null]]];
//    NSLog(@"%@",mArray);
    NSMutableDictionary *mDict = [NSMutableDictionary new];
    [mDict setObject:[NSNull null] forKey:@"key2"];
    NSLog(@"%@",mDict);
    Class testClass = Nil;
//    testClass *ccc = [testClass new];
    
    
}
- (void)storArray{
//    排序测试
    
    //    NSArray *tMlist = @[@1,@5,@2,@6,@3,@7,@9];
    //    NSArray *tArray = [tMlist sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
    //        NSNumber *tNumber1 = (NSNumber *)obj1;
    //        NSNumber *tNumber2 = (NSNumber *)obj2;
    //        // 因为不满足sortedArrayUsingComparator方法的默认排序顺序，则需要交换
    //        if ([tNumber1 integerValue] < [tNumber2 integerValue]) return NSOrderedDescending;
    //        return NSOrderedAscending;
    //    }];
    //    NSLog(@"降序%@",tArray.description);
    
}
- (void)testLabelheight{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 100, 10)];
    label.backgroundColor = [UIColor grayColor];
    label.text = @"label 高度测试";
    [self.view addSubview:label];
}
-(void)testADScrollView{
//    HDADScrollView *scrollView = [[HDADScrollView alloc] initWithFrame:CGRectMake(0, 0, HD_SW, HDTotalScreenHeight)];
//    [self.view addSubview:scrollView];
//    scrollView.dataArray = @[@"名片背景3",@"名片背景3",@"名片背景3"].mutableCopy;
//    scrollView.backgroundColor = [UIColor cyanColor];
}
- (void)presenterLoadDataSuccess:(NSMutableArray *)dataArray{
    [self.tableView addDataToTableView:dataArray];
}

-(void)testSafeArea{
    
     NSLog(@"safeAreaInsets %@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
}
- (void)testImage{
    UIImage *bgImage = [UIImage imageNamed:@"bgImage"];
    CGRect frame = CGRectMake(0, 200, self.view.bounds.size.width, 100);
    HDImageView *imageView = [[HDImageView alloc] initWithImage:bgImage];
    self.imageView = imageView;
    UIView *topView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:imageView];
    [self.view addSubview:topView];
    topView.alpha = 0.1;
    topView.backgroundColor = [UIColor greenColor];
    imageView.backgroundColor = [UIColor grayColor];
    
    imageView.clipsToBounds = YES;// 避免图片超出边界
//    CGSize imageSize = bgImage.size;
//    拉伸填充，拉伸最小的边，填充容器
//    拉伸宽度
//    CGFloat scale = frame.size.width/imageSize.width;
    
    
    
//    imageView.image = bgImage;
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.contentMode = UIViewContentModeScaleAspectFill ;
//    imageView.contentMode = UIViewContentModeTopLeft | UIViewContentModeScaleAspectFill ;
//    CALayer *imageLayer = imageView.layer;
//    imageLayer.anchorPoint = CGPointMake(0, 0);
    
//    NSLog(@"imageView.bounds = %@,imageLayer.bounds = %@",NSStringFromCGRect(imageView.bounds),NSStringFromCGRect(imageLayer.bounds));
//    NSLog(@"imageView.center = %@,imageLayer.position = %@",NSStringFromCGPoint(imageView.center),NSStringFromCGPoint(imageLayer.position));
//    NSLog(@"imageLayer.zPosition = %f",imageLayer.zPosition);
//    NSLog(@"imageLayer.anchorPoint = %@",NSStringFromCGPoint(imageLayer.anchorPoint));
//    NSLog(@"imageView.frame = %@,imageLayer.frame = %@",NSStringFromCGRect(imageView.frame),NSStringFromCGRect(imageLayer.frame));
//    NSLog(@"fordImage.size = %@",NSStringFromCGSize(self.fordImage.size)); // 图片的原始大小
    [self setImageViewFrame];
}
- (void)setImageViewFrame{
    CGRect frame = CGRectMake(0, 200, self.view.bounds.size.width, 100);
    self.imageView.frame = frame;
//    [self.imageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"bgImage"]];
    self.imageView.image = [UIImage imageNamed:@"bgImage"];
    [self.imageView customLayoutSubviews];
}
- (void)testNavigationBar{
     NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    self.navigationController.navigationBarHidden = YES;
    
     NSLog(@"%f",[[UIApplication sharedApplication] statusBarFrame].size.height);
}
- (void)setBaseProperty{
    self.title = @"HOME";
    self.view.backgroundColor = [UIColor whiteColor];
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    
}
- (void)customAddSubviews{
    self.tableView = [[HDHomeTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.selectedDelegate = self;
}
- (void)homeTableViewDidSelectedRowWithClassName:(NSString *)classNameString{
    Class vcClass = NSClassFromString(classNameString);
    UIViewController *toVC = [[vcClass alloc] init];
    [self.navigationController pushViewController:toVC animated:YES];
}
- (void)customLayoutSubviews{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor cyanColor];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
//    [self testNavigationBar];
    //    [self pushToNextController];
    //    UIButton *nextVCB = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    [self.view addSubview:nextVCB];
    //    [nextVCB setTitle:@"presentVC" forState:UIControlStateNormal];
    //    [nextVCB setBackgroundColor:[UIColor redColor]];
    //    [nextVCB addTarget:self action:@selector(pushToNextController) forControlEvents:UIControlEventTouchUpInside];
    //
}
- (void)testScrollView{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor cyanColor];
//    scrollView.contentInset = UIEdgeInsetsMake(0, -30, 0, 0);
    scrollView.contentSize = CGSizeMake(300, 200);
    scrollView.contentOffset = CGPointMake(30, 100);
    
    
}
- (void)testMutabelArray{
    NSMutableArray *mArr = @[@1,@2].mutableCopy;
    [mArr insertObject:@5 atIndex:5];
}
- (void)testArray{
    id sonnn = [Son new];
   id a =  sonnn[1];
     NSLog(@"%@",a);
}
- (void)testVersion{
    NSDictionary *info= [[NSBundle mainBundle] infoDictionary];
    
     NSLog(@"%@",info[@"CFBundleShortVersionString"]);
    //Version
    // Build
     NSLog(@"%@",info[@"CFBundleVersion"]);
}
- (void)testAlertView{
    UIAlertView  *alert=[[UIAlertView alloc] initWithTitle:nil message:@"频道已开始直播,是否观看直播" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    alert.tag = 10;
    [alert show];
}
- (void)testFirstresponderBottomValue{
    CGRect barFrame =  self.navigationController.navigationBar.frame;
    CGRect viewFrame =  self.view.frame;
    CGRect windowFrame = [UIApplication sharedApplication].keyWindow.frame;
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:testView];
    testView.backgroundColor = [UIColor redColor];
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(25, 25, 50, 50)];
    greenView.backgroundColor = [UIColor greenColor];
    [testView addSubview:greenView];
    
    NSLog(@"barFrame %@",NSStringFromCGRect(barFrame));
    NSLog(@"viewFrame %@",NSStringFromCGRect(viewFrame));
    NSLog(@"windowFrame %@",NSStringFromCGRect(windowFrame));
    NSLog(@"testView.frame %@",NSStringFromCGRect(testView.frame));
    NSLog(@"greenView.frame %@",NSStringFromCGRect(greenView.frame));
    NSLog(@"%@",NSStringFromCGRect([testView convertRect:greenView.frame toView:[UIApplication sharedApplication].keyWindow]));
}

- (void)testDic{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:5];
    [dic setObject:@"1" forKey:@"yi"];
    [dic setObject:@"5" forKey:@"san"];
    [dic setObject:@"2" forKey:@"er"];
    [dic setObject:@"4" forKey:@"wu"];
    [dic setObject:@"3" forKey:@"si"];
     NSLog(@"%@",dic);
    NSString *str;
    NSDictionary *dict = @{[NSNull null]:@"1",@"2key":@"2"};
     NSLog(@"%@",dict);
}
- (void)testButton{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 343, 35)];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btn];
    [btn setTitle:@"残忍拒绝" forState:UIControlStateNormal];
    [btn setTitle:@"dianjidianji" forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"timeImage"] forState:UIControlStateNormal];
    
    btn.imageView.frame = CGRectMake(10, 10, 16, 16);
    
    
}
- (void)testSafeMutabelArray{
    NSArray *arr = @[@1,@2,@3];
    NSMutableArray *mArr = [NSMutableArray arrayWithArray:arr];
     NSLog(@"%@",mArr);
     NSLog(@"%@",[mArr objectAtIndex:3]);
}
- (void)testSubClassFunction{
    Son * s = [[Son alloc] init];
//    [s run];
    self.son = s;
    
    self.son.btn.frame = CGRectMake(100, 100, 100, 100);
    self.son.btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.son.btn];
}
- (void)setState{
    self.button.selected = !self.button.selected;
    NSLog(@"%@",@"setState1");
}
- (void)setState2{
     NSLog(@"%@",@"setState2");
}
- (void)testSwitch{
    
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:v];
    v.backgroundColor = [UIColor redColor];
    v.clipsToBounds = YES;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(-10, 2, 100, 2)];
    [v addSubview:line];
    [line setBackgroundColor:[UIColor greenColor]];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//    [self.view addSubview:btn];
//    self.button = btn;
//    [btn setBackgroundColor:[UIColor redColor]];
//    [btn setImage:[UIImage imageNamed:@"Off"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"On"] forState:UIControlStateSelected];
//    [btn addTarget:self action:@selector(setState) forControlEvents:UIControlEventTouchUpInside];
//    [btn addTarget:self action:@selector(setState2) forControlEvents:UIControlEventTouchUpInside];
//
//
//
//
//
//
//
//    HDBarrageSwitch *sw = [[HDBarrageSwitch alloc] initWithFrame:CGRectMake(200, 250, 150, 75)];
//    [self.view addSubview:sw];
//    [sw addTarget:self action:@selector(switchONorOFF:) forControlEvents:UIControlEventValueChanged];
//    [sw addTarget:self action:@selector(switchONorOFF2:) forControlEvents:UIControlEventValueChanged];
//     系统Switch 大小固定为51 31  无法修改大小，仅仅可以修改位置
//    UISwitch *switchButton = [[UISwitch alloc ] initWithFrame:CGRectMake(200, 200, 100, 50)];
//    UISwitch *switchButton2 = [[UISwitch alloc ] initWithFrame:CGRectMake(200, 250, 150, 75)];
////    [self.mySwitch addObserver:self forKeyPath:@"onTintColor" options:NSKeyValueObservingOptionNew context:nil];
//    self.mySwitch = switchButton2;
////    switchButton2.bounds = CGRectMake(0, 0, 100, 50);
////   关闭开关的背景色
////    switchButton2.tintColor = [UIColor blueColor];
////    开启开关后的背景色
//    switchButton2.onTintColor = MakeColorRGB(0xFF5B29);
////    中间小圆圈的颜色
////    switchButton2.thumbTintColor = [UIColor redColor];
//
//
//    [self.view addSubview:switchButton];
//    [self.view addSubview:switchButton2];
//
////    找到imageview 放到上面一个label
//    UIImageView *switchImageView  = nil;
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 43, 37)];
//    self.sLabel = label;
//    label.text = @"弹幕";
////    label.bounds = CGRectMake(-10, -9, 43, 43);
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = MakeColorRGB(0x9B9B9B);
//
//    label.font = [UIFont systemFontOfSize:10];
//    for (UIView *sub in [switchButton2.subviews.lastObject subviews]) {
//         NSLog(@"%@",sub);
//        if ([sub isMemberOfClass:[UIImageView class]]) {
//            switchImageView = (UIImageView *)sub;
//        }
//    }
//    [switchImageView addSubview:label];
//
//    [switchButton2 addTarget:self action:@selector(switchONorOFF:) forControlEvents:UIControlEventValueChanged];
//    [switchButton2 addObserver:self forKeyPath:@"on" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}
- (void)switchONorOFF2:(UISwitch *)sw{
    NSLog(@"%s",__func__);
    //    self.sLabel.textColor = sw.isOn ?MakeColorRGB(0xFF5B29): MakeColorRGB(0x9B9B9B);
}
- (void)switchONorOFF:(UISwitch *)sw{
    NSLog(@"%s",__func__);
//    self.sLabel.textColor = sw.isOn ?MakeColorRGB(0xFF5B29): MakeColorRGB(0x9B9B9B);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
     NSLog(@"%@",keyPath);
    if ([keyPath isEqualToString:@"isOn"]) {
         NSLog(@"%d",self.mySwitch.isOn);
    }
}
- (void)testButtonLabel{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 104, 36)];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
    
    UILabel * _giftMoneyLabel = [[UILabel alloc]initWithFrame:btn.bounds];
    _giftMoneyLabel.font = [UIFont systemFontOfSize:15];
    //设置Attachment
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    //使用一张图片作为Attachment数据
    attachment.image = [UIImage imageNamed:@"一路發"];
    
     NSLog(@"%@",NSStringFromCGRect(attachment.bounds));
    attachment.bounds = CGRectMake(5, -7, 54, 26);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"打赏"];
    [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    _giftMoneyLabel.attributedText = attributedString;
    
    
    [btn addSubview:_giftMoneyLabel];
    
}
- (void)testLabel{
    UILabel *rLabel = [[UILabel alloc] init];
    rLabel.text = @"我是名字";
//    NSDictionary *attrs = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 12.0],NSForegroundColorAttributeName: [UIColor whiteColor],NSStrokeWidthAttributeName:@-5,NSStrokeColorAttributeName: [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:0.7]};
//    CGSize size = [rLabel.text sizeWithAttributes:attrs];
//     NSLog(@"%@",NSStringFromCGSize(size));
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:rLabel.text attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size: 12.0],NSForegroundColorAttributeName: [UIColor whiteColor],NSStrokeWidthAttributeName:@-5,NSStrokeColorAttributeName: [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:0.7]}];

//    rLabel.attributedText = string;

//    rLabel.text = @"sjfngoiyaijop";

    
    rLabel.backgroundColor = [UIColor cyanColor];
    rLabel.frame = CGRectMake(100, 100, 100, 18);
    rLabel.font = [UIFont systemFontOfSize:12];
//    [rLabel adjustsFontSizeToFitWidth];
//    [rLabel sizeToFit];
    
    rLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:rLabel];
    
        NSString * str = [NSString stringWithFormat:@" | %@",rLabel.text];
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:str];
        NSTextAttachment *attchment = [[NSTextAttachment alloc] init];
        // 表情图片
        attchment.image = [UIImage imageNamed:@"企业认证"];
        // 设置图片大小
        attchment.bounds = CGRectMake(0, -3 , 24, 14 );
        NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchment];
        [attStr insertAttributedString:stringImage atIndex:0];
        
        rLabel.attributedText = attStr;
//    
}

- (void)testLottie{
//    UIButton *centerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    centerButton.center = self.view.center;
//    centerButton.backgroundColor = [UIColor cyanColor];

//    [self.view addSubview:centerButton];
//    NSString *str = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"yymm_big.json" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
//     NSLog(@"--------%@",str);
//    LOTAnimationView *aniView = [LOTAnimationView alloc]
//LOTAnimationView *aniView = [LOTAnimationView animationNamed:@"yymm_big" inBundle:[NSBundle mainBundle]];
    LOTAnimationView *aniView = [LOTAnimationView animationNamed:@"ylf"];
    [self.view addSubview:aniView];
    aniView.frame = CGRectMake(0, 300, 90*2, 26*2);
    aniView.contentMode = UIViewContentModeScaleAspectFit;
    aniView.backgroundColor = [UIColor blueColor];
    [aniView pause];
//    aniView.loopAnimation = YES;
    LOTAnimationView *aniView1 = [LOTAnimationView animationNamed:@"cjsss"];
    [self.view addSubview:aniView1];
    aniView1.frame = CGRectMake(90*2, 300, 90*2, 26*2);
    aniView1.contentMode = UIViewContentModeScaleAspectFit;
    aniView1.backgroundColor = [UIColor purpleColor];
    [aniView1 pause];
    aniView1.loopAnimation = YES;
//
//    [aniView playWithCompletion:^(BOOL animationFinished) {
//        NSLog(@"完成");
//
//    }];
}
-(void)testNetworkTool{
//    HDNetworkTool *networkTool = [HDNetworkTool shareManager];
//    [networkTool hd_Get:@"http://coolaf.com/m?a=1&b=2" parameters:nil success:^(id  _Nonnull responseBody) {
//        NSLog(@"%@",responseBody);
//    } failure:^(NSString * _Nonnull error) {
//         NSLog(@"%@",error);
//    }];
}

- (void)testHash{
    NSString *str = @"1233456789";
    NSLog(@"%lu",(unsigned long)[str hash]);
}
- (void)getHTMLString{
    NSString *str = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://blog.csdn.net/qq_29480617/article/details/79791462"] encoding:NSUTF8StringEncoding error:nil];
     NSLog(@"%@",str);
}
- (void)testScope{
    NSString *str = @"3";
    
    NSString *str1 = [str stringByAppendingString:@"1"];
     NSLog(@"%@",str1);
    //    for (int i =0; i <100000; i ++) {
//        NSString *str =[NSString stringWithFormat:@"%d",i];
//         NSLog(@"%@",str);
//    }

//    id __weak obj0 = nil;
    {
//        id __weak obj0 = [[NSObject alloc] init];
//         NSLog(@"%@",obj0);
//        _objc_autoreleasePoolPrint();
    }
// NSLog(@"%@",obj0);
}
- (void)testSingleton{
    self.son = [[Son alloc] init];
     NSLog(@"%@",self.son.name);
//     NSLog(@"%@",[[NetworkTool alloc] init]);
//    NSLog(@"%@",[NetworkTool shareNetworkTool]);
//     NSLog(@"%@",[[NetworkTool shareNetworkTool] copy]);
}
- (void)testYYModel{
    NSDictionary *dic = @{@"name": @"oneName",
                          @"age": @15,
                          @"level":@"level3",
                          @"book":@{@"bookName":@"bookName",
                                    @"price":@99
                                    }
                          };
    self.modelOne = [TestOneModel modelWithJSON:dic];
    
    Class cls;
    
    [cls respondsToSelector:@selector(viewDidLayoutSubviews)];
    
    
    
}

- (void)navigateToWeb{
    WKWebViewController *web = [[WKWebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
}
- (void)pushToNextController{
//    [self.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
    HDViewController *vc = [[HDViewController alloc] init];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
}
- (void)testIncreasFunction{
    int a=5,b=8;
    a++;
    printf("%d\n",a+b);
    printf("%d\n",((++a)+b));
    printf("%d\n",((a++)+b));
    printf("%d\n",a);
}
- (void)testNSCopying{

    Person *p1 = [[Person alloc] init];
    p1.name = @"p1 name";
    self.p = p1;
     NSLog(@"%@--%p",p1,p1);
    
    Person *p2 = [p1 copy];
     NSLog(@"%p",p2);
}
- (void)checkMArray{
//    int a[100000] = {1,2,3,4,5};
    
    HDCheckArray *cArr = [[HDCheckArray alloc] init];
    NSMutableArray *marr = [NSMutableArray arrayWithObjects:@1,@2,@3,@1,@5, nil];
     NSLog(@"%@",[cArr checkArrayInMutableArray:marr]);
    
}
- (void)addCornerImage{
    UIImageView *imageView = [[UIImageView alloc] init];
    UIImageView *imageView2 = [[UIImageView alloc] init];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
       UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://b.hiphotos.baidu.com/image/pic/item/03087bf40ad162d93b3a196f1fdfa9ec8b13cde9.jpg"]]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = img;
            imageView.frame = CGRectMake(50, 50, 300, 130);
            imageView.center = CGPointMake(self.view.center.x, 200) ;
            imageView2.image = img;
            imageView2.frame = CGRectMake(50, 50, 300, 130);
            imageView2.center = CGPointMake(self.view.center.x, 400) ;
            
            [self.view addSubview:imageView];
            [self.view addSubview:imageView2];
            //    设置圆角
            [self cornerRadius3:imageView];
            [self cornerRadius4:imageView2];
        });
    });
    

    
}
- (void)cornerRadius1:(UIImageView *)imageView{
    imageView.layer.cornerRadius = 15;
    imageView.layer.masksToBounds = YES;
}
- (void)cornerRadius2:(UIImageView *)imageView{
   
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size,NO,1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:15] addClip];
    [imageView drawRect:imageView.bounds];
//    这种方法是重新绘制了一个圆角图片
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
    
}
- (void)cornerRadius3:(UIImageView *)imageView{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds  byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(15, 15)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];//设置大小
    maskLayer.frame = imageView.bounds;//设置图形样子
    maskLayer.path = maskPath.CGPath;
//    实际做的是对imageView加了一个遮罩
    imageView.layer.mask = maskLayer;

   
}
- (void)cornerRadius4:(UIImageView *)imageView{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds  byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(15, 50)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];//设置大小
    maskLayer.frame = imageView.bounds;//设置图形样子
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    
    
}
- (void)testCategory{
    self.son = [[Son alloc] init];
    [self.son run];
}
- (void)testForLoop{
    for (int i = 0 ; i <10 ; ++i) {
         NSLog(@"%@",[NSNumber numberWithInt:i]);
    }
}
- (void)testLocalVariable{
    
//    局部变量的引用计数很大，在没有出作用域时，无论局部变量赋值给谁，都不会释放。
    NSString *a = [NSString stringWithFormat:@"111"];
     NSLog(@"%@",[a valueForKey:@"retainCount"]);
    self.bString = a;
    
    
     NSLog(@"%@",self.bString);
     NSLog(@"%@",a);
     NSLog(@"%@",[a valueForKey:@"retainCount"]);
     NSLog(@"%@",[self.bString valueForKey:@"retainCount"]);
}
- (void)testRunloop{
//    测试 子线程中是否开启runloop之前需要添加事件源或者计时器
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"%@",[NSThread currentThread]);
//         NSLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
//                [[NSRunLoop currentRunLoop] run];
//        [self performSelector:@selector(print) withObject:nil afterDelay:0];
//        NSLog(@"%@",[NSRunLoop currentRunLoop]);
//
//    });
    
    
//    timer的这个方法，自动将timer加入到了运行循环中，那runloop会不会对timer强引用了呢？
//    经过测试timer作为局部变量添加到runloop中，timer的操作会一直执行，不会被释放
    
//    如果这个timer的target是self 是否self无法释放了呢？
//    self再被添加到timer中后引用计数+1 只有timerv被释放后，引用计数才会-1
     NSLog(@"%@",[self valueForKey:@"retainCount"]);
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(print) userInfo:nil repeats:YES];
//    NSLog(@"%@",[self valueForKey:@"retainCount"]);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"%@",[self valueForKey:@"retainCount"]);
//        [timer invalidate];
//        NSLog(@"%@",[self valueForKey:@"retainCount"]);
//    });
    
}

- (void)print{
    
     NSLog(@"%@",@"print");
    
    
}
- (void)testGCD1{
    
    dispatch_queue_t serialQueue = dispatch_queue_create("name.nameSerial", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("name.nameConcurrent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    // 1.1,主线程同步主队列
    // 死锁  原因：同步函数不能开启新的线程，但是任务添加到主队列需要在主线程中执行，因此当前主线程停下等待主队列最后的一个任务执行，但是队列中最后任务需要等待前面所有任务执行完毕，相互等待造成死锁。
//    dispatch_sync(mainQueue, ^{
//        NSLog(@"%@---%@",@"1,主线程同步主队列",[NSThread currentThread]);
//    });
//    1.2 主线程同步并发队列
//    正常 并发队列中的任务在主线程中执行了  也说明一个线程可以执行多个队列中的任务
//    使用dispatch_sync 添加同步任务，必须等添加的block执行完成之后才返回。
//    既然要执行block，肯定需要线程，要么新开线程执行，要么再已存在的线程（包括当前线程）执行。
//    dispatch_sync的官方注释里面有这么一句话：
//    As an optimization, dispatch_sync() invokes the block on the current thread when possible.
//    作为优化，如果可能，直接在当前线程调用这个block。
//    所以，在大多数情况下，通过dispatch_sync添加的任务，在哪个线程添加就会在哪个线程执行。
//    上面我们添加的任务的代码是在主线程，所以就直接在主线程执行了。
    
    
//    为什么全局队列中的第一任务没有结束就可以执行第二个任务？？？
//    NSLog(@"%@",@"111");
//    dispatch_sync(globalQueue, ^{
//         NSLog(@"%@",globalQueue);
//        NSLog(@"%@",@"222");
//        dispatch_sync(globalQueue, ^{
//             NSLog(@"%@",globalQueue);
//            NSLog(@"%@---%@",@"5,主线程执行全局队列中的任务时，再同步全局队列",[NSThread currentThread]);
//        });
//        NSLog(@"%@",@"333");
//    });
//    NSLog(@"%@",@"444");

//    为什么并发队列中的第一任务没有结束就可以执行第二个任务？？？
//    并发队列表现的特性和全局队列一致
    
    
//    单一子线程，同步去执行当前串行队列后面的任务 死锁 符合预期
    
//    正常执行 子线程中的同步主队列任务，需要在当前主线程所有任务执行完毕后执行
    
//    正常执行 子线程中的同步并发队列任务，同一个线程可以执行多个队列中的任务
    
//    正常执行 同并发队列
    
//    正常执行 由并发/全局队列开启的子线程，同步执行都是正常的  这和串行/主队列的表现不一样，原因应该处在队列上
    
    // 从主线程来到了新的子线程中
    
//    三个任务按顺序添加到串行队列中
    
//  dispatch_barrier_async栅栏函数使用时注意对于全局队列来说是无效的而对于并发队列来说是有效的
    
//   异步串行队列创建的子线程内，再使用异步串行队列不会再创建子线程
    
//    信号量的方式可以控制多线程中异步任务的有序执行

//   在简单执行异步打印操作时，结果是无序的，同一个队列任务开始应该是有序的才对呀？
//    dispatch_async(concurrentQueue, ^{
//
//        NSLog(@"%@--%@",@"AAA",[NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
//
//        NSLog(@"%@--%@",@"BBB",[NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
//
//        NSLog(@"%@--%@",@"CCC",[NSThread currentThread]);
//    });
//    self.mArray = [NSMutableArray array];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"%@--%@",@"延迟执行",[NSThread currentThread]);
////        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self performSelector:@selector(delayAction) withObject:nil afterDelay:1];
////        });
//
//    });
    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, globalQueue, ^{
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"111%@",[NSThread currentThread]);
//    });
//    dispatch_group_async(group, globalQueue, ^{
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"222%@",[NSThread currentThread]);
//    });
//    dispatch_group_async(group, globalQueue, ^{
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"333%@",[NSThread currentThread]);
//    });
    dispatch_group_enter(group);
    dispatch_async(globalQueue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"333%@",[NSThread currentThread]);
    });
    dispatch_async(globalQueue, ^{
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, globalQueue, ^{
        NSLog(@"%@",@"任务执行完毕");
    });
}

-(void)delayAction{
     NSLog(@"%@--%@",@"延迟执行",[NSThread currentThread]);
}
- (void)timeConsumingTask:(NSInteger)magnitude{
    
    int j = pow(10, magnitude);
    for (int i =0 ; i < j; i ++) {
        NSMutableArray * mArr =[NSMutableArray new];
        [mArr addObject:@"111"];
//        self.mArray = mArr;
    }
}




- (void)testString{
//     创建一个json 一个plist文件
//    放到本地
//    偏好设置本质是通过plist存储数据 使用简单
//    NSKeyedArchiver  等各种持久化存储，除了数据库
//    把新的的字典 数组 data写入到文件中
    NSString *str1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *str2 = [str1 stringByAppendingPathExtension:@"您好未来！"];
    NSString *str3 = [str2 pathExtension];
    
    NSLog(@"%@-- \n%@-- \n%@ - %@",str1,str2,str3,[str1 capitalizedString]);
     NSLog(@"%p-- %p-- %p",str1,str2,str3);
    
}
- (void)testKVO{
    self.son  = [[Son alloc] init];
        NSMutableString *str = [NSMutableString stringWithString:@"123"];
    
    self.son.name = str;
     NSLog(@"%@",self.son.name);
    [str setString:@"234"];
    
     NSLog(@"%@",self.son.name);
    [self.son addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [self.son run];
    
    [self.son setValue:nil forKey:@"fathername"];
    
     NSLog(@"%@",[self.son valueForKey:@"fathername"]);
}
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//     NSLog(@"%@",change);
//}
- (void)testResponderChain{
     NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    SubView * v1 = [[SubView alloc] initWithFrame:CGRectMake(0, 0, 500, 500)];
    v1.name = @"v1";
    v1.userInteractionEnabled = YES;
    v1.backgroundColor = [UIColor blackColor];
    SubView * v2 = [[SubView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    v2.name = @"v2";
    v2.backgroundColor = [UIColor blueColor];
    SubView * v3 = [[SubView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    v3.name = @"v3";
    v3.backgroundColor = [UIColor purpleColor];
    
    UIButton * v4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [v4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    v4.name = @"v4";
    v4.backgroundColor = [UIColor redColor];
    [self.view addSubview:v1];
    [v2 addSubview:v4];
    [v1 addSubview:v3];
    [v1 addSubview:v2];
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction1)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2)];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction3)];
//    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction4)];
    [v1 addGestureRecognizer:tap1];
    [v2 addGestureRecognizer:tap2]; 
    [v3 addGestureRecognizer:tap3];
//    [v4 addGestureRecognizer:tap4];
//    tap.delegate =  self;
    
}

- (void)buttonAction:(UIButton *)btn{
     NSLog(@"%@",btn);
     NSLog(@"%@",[self.son.name valueForKey:@"retainCount"]);
    if ([self.son.name isEqualToString:@"name1"]) {
        
        self.son.name = @"name2";
    }else{
        self.son.name = @"name1";
    }
}
- (void)tapAction1{
     NSLog(@"%@",@"tapAction-----1");
}
- (void)tapAction2{
    NSLog(@"%@",@"tapAction-----2");
}
- (void)tapAction3{
    NSLog(@"%@",@"tapAction-----3");
}
- (void)tapAction4{
    NSLog(@"%@",@"tapAction-----4");
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    NSLog(@"%s",__func__);
    return YES;
}
- (void)drawImageFromLabel{
//    - (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width{
//        CGSize size = CGSizeMake(width, font.pointSize+10);
//        CGContextSetTextMatrix(context,CGAffineTransformIdentity);
//        CGContextTranslateCTM(context,0,height);
//        CGContextScaleCTM(context,1.0,-1.0);
//
//        //Determine default text color
//        UIColor* textColor = color;
//        //Set line height, font, color and break mode
//        CTFontRef font1 = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize,NULL);
//        //Apply paragraph settings
//        CGFloat minimumLineHeight = font.pointSize,maximumLineHeight = minimumLineHeight+10, linespace = 5;
//        CTLineBreakMode lineBreakMode = kCTLineBreakByTruncatingTail;
//        CTTextAlignment alignment = kCTLeftTextAlignment;
//        //Apply paragraph settings
//        CTParagraphStyleRef style = CTParagraphStyleCreate((CTParagraphStyleSetting[6]){
//            {kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
//            {kCTParagraphStyleSpecifierMinimumLineHeight,sizeof(minimumLineHeight),&minimumLineHeight},
//            {kCTParagraphStyleSpecifierMaximumLineHeight,sizeof(maximumLineHeight),&maximumLineHeight},
//            {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(linespace), &linespace},
//            {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(linespace), &linespace},
//            {kCTParagraphStyleSpecifierLineBreakMode,sizeof(CTLineBreakMode),&lineBreakMode}
//        },6);
//
//        NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font1,(NSString*)kCTFontAttributeName,
//                                    textColor.CGColor,kCTForegroundColorAttributeName,
//                                    style,kCTParagraphStyleAttributeName,
//                                    nil];
//        //Create path to work with a frame with applied margins
//        CGMutablePathRef path = CGPathCreateMutable();
//        CGPathAddRect(path,NULL,CGRectMake(p.x, height-p.y-size.height,(size.width),(size.height)));
//
//        //Create attributed string, with applied syntax highlighting
//        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
//        CFAttributedStringRef attributedString = (__bridge CFAttributedStringRef)attributedStr;
//
//        //Draw the frame
//        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
//        CTFrameRef ctframe = CTFramesetterCreateFrame(framesetter, CFRangeMake(0,CFAttributedStringGetLength(attributedString)),path,NULL);
//        CTFrameDraw(ctframe,context);
//        CGPathRelease(path);
//        CFRelease(font1);
//        CFRelease(framesetter);
//        CFRelease(ctframe);
//        [[attributedStr mutableString] setString:@""];
//        CGContextSetTextMatrix(context,CGAffineTransformIdentity);
//        CGContextTranslateCTM(context,0, height);
//        CGContextScaleCTM(context,1.0,-1.0);
//    }
//
//    - (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height{
//        [self drawInContext:context withPosition:p andFont:font andTextColor:color andHeight:height andWidth:CGFLOAT_MAX];
//    }
}
// 测试同步主队列、全局队列、串行队列、并行队列中的会不会死锁
// 我认为同步都不会开辟新的线程，使用同步函数在某一个队列中添加任务，都会在该队列原有的执行情况中运行
// 比如在子线程 同步添加到主队列，需要等待添加的任务到主线程中执行完毕 如果是主队列同步添加到串行队列而之前该串行队列已经在某一个子线程中执行，那是不是该任务会在原来的线程中执行呢？


- (void)testGCD{
    self.mArray = [NSMutableArray new];
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.apple.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(5);
//    for (int i = 0 ; i < 100; i ++) {
//        dispatch_async(concurrentQueue, ^{
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            [self.mArray addObject:[NSNumber numberWithInt:i]];
//
//             NSLog(@"%@",[NSThread currentThread]);
////            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            for (int j = 0; j < 10000000; j++) {
//                if (j == 99999) {
//                    dispatch_semaphore_signal(semaphore);
//                }
//            }
//
////            });
//        });
//    }
    NSLock *lock = [[NSLock alloc] init];
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, concurrentQueue, ^{
         NSLog(@"%@",@"1");
        
        [lock lock];
        dispatch_async(concurrentQueue, ^{
            for (int  i =0  ; i < 10000000; i ++) {
                [self.mArray addObject:@"q"];
            }
            NSLog(@"%@",@"1---1");
        });
//        dispatch_group_async(group2, concurrentQueue, ^{
//            for (int  i =0  ; i < 10000000; i ++) {
//                [self.mArray addObject:@"q"];
//            }
//            NSLog(@"%@",@"1---1");
//        });
//        dispatch_group_notify(group2, concurrentQueue, ^{
        [lock unlock];
//             NSLog(@"%@",@"任务1中的耗时操作完成");
//        });
    });
    dispatch_group_notify(group, concurrentQueue, ^{

        NSLog(@"%@",@"4");
    });

    dispatch_group_async(group, concurrentQueue, ^{
        for (int  i =0  ; i < 10000000; i ++) {
            [self.mArray addObject:@"q"];
        }
        NSLog(@"%@",@"2");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"%@",@"3");
    });
    dispatch_barrier_async(concurrentQueue, ^{
        NSLog(@"%@",@"barrier");
    });
//
//    long result = dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)));
//    if (result == 0) {
//        NSLog(@"%@",@"任务全部完成");
//    }else{
//        NSLog(@"%@",@"任务没有全部完成");
//    }
//
//    NSLog(@"result = %ld",result);
//     NSLog(@"%@",@"aaaaaaaaaa");
    
    
//    for (int i = 0; i < 10; i ++) {
//        dispatch_async(concurrentQueue, ^{
//            if (i == 5) {
//                [self.mArray addObject:@"5"];
//
//            }
//            if (i%2 ==0) {
//                [self.mArray addObject:@"2"];
//            }else{
//                [self.mArray addObject:@"1"];
//            }
//
//        });
//        NSLog(@"%@---%@",self.mArray,[NSThread currentThread]);
//    }
  
    
    
    
    
}
- (void)sort{
//    NSString * str = @"abc";
//    NSMutableString * str1 = [str mutableCopy];
//    NSMutableString * str2 = [str1 copy];
//    [str1 appendString:@"d"];
//     NSLog(@"%@",str1);
    NSArray *arr = @[@"abc"];
    NSMutableArray *arr1 = [arr mutableCopy];
    NSMutableArray *arr2 = [arr1 copy];
//    NSMutableArray *arr3 = [NSMutableArray arrayWithArray:@[@1]];
//     NSLog(@"%@",arr3);
    [arr1 addObject:@"def"];
    [arr2 addObject:@"def"];
//    NSMutableArray *arr = [NSMutableArray arrayWithArray: @[@3,@2,@4,@5,@1]];
    
    
//     NSLog(@"%@",arr);
//    int temp;
//    for (int i =0; i < arr.count; i ++) {
//        for (int j = arr.count -1; j> i; --j) {
//
//            if (arr[j] < arr[j-1]) {
//                temp = [arr[j] intValue];
//                arr[j] = arr[j-1];
//                arr[j-1] = [NSNumber numberWithInt:temp];
//
//            }
//            NSLog(@"%@",arr);
//        }
//    }
}
- (void)sendMessageToNilObject{
    [self.p run];
}
- (void)testBlockFunction:(long)a{
    
//    block 为什么使用copy
//    block属性是在堆中还是栈中
//    为什么block内部可以修改外面的局部变量
    
//    block内部使用局部变量时，如果不加__bloc，1，局部变量传递的是值而不是地址，如果在block调用前修改了传入的值，block内部的变量不会修改，如果直接修改外部变量，则会报错。
    
    
    
//    1，block内部是传值还是传地址
    
//    常量区
    NSString *str = @"abc";
    NSLog(@"常量字符串地址：%p",str);//常量字符串，存在常量区
    NSLog(@"常量字符串地址：%p",&str);//常量字符串，存在常量区

//      静态区/全局区    静态区的指针自身的地址也在静态区  其他的局部变量都在栈区
     static NSString *str1 = @"dddd";
    NSLog(@"静态区/全局区 常量字符串地址：%p",str1);//常量字符串，存在常量区
    NSLog(@"静态区/全局区 常量字符串地址：%p",&str1);//常量字符串，存在常量区
//    基本类型
     __block int i = 10;
//    NSLog(@"常量区 基本数据类型int地址：%p",i);//全局初始化区（数据区）
    NSLog(@"常量区 基本数据类型int地址：%p",&i);//全局初始化区（数据区）
//    对象
    __block NSMutableString *mString = [NSMutableString stringWithFormat:@"a"];
    NSLog(@"堆区局部变量mString地址：%p",mString); // 表示mString这个指针指向的位置 堆区
    NSLog(@"堆区局部变量mString地址：%p",&mString);// 表示mString这个指针所在的位置 栈区
    
    
    
//    属性
    self.mString = mString;
    NSLog(@"堆区self.mString 地址：%p",self.mString);
    NSLog(@"堆区self.mString 地址：%p",&self->_mString);
    
    
    
    someBlock blo1 =^{
        NSLog(@"%@",@"11");
    };
    NSLog(@"不引用外部变量的block地址：%p",blo1);//地址显示在常量区
    
    NSLog(@"%@----%p---%p",self,self,&self);
    NSLog(@"%@----%p---%p\n------------\n",self.mString,self.mString,&self->_mString);
    __weak typeof(self) weakSelf = self;
    NSLog(@"%@",[self valueForKey:@"retainCount"]);
    someBlock blo2 =^{
//        NSLog(@"常量区 基本数据类型int地址：%p",i);//全局初始化区（数据区）
//        NSLog(@"常量区 基本数据类型int地址：%p",&i);//全局初始化区（数据区）
//                i = i +10;
//        NSLog(@"%d----%p---%p",i,i,&i);
//        NSLog(@"66666666%@----%p---%p",str,str,&str);
//        NSLog(@"内部%@----%p---%p",str1,str1,&str1);
        NSLog(@"内部%@----%p---%p",mString,mString,&mString);
//        NSLog(@"内部%@----%p---%p",weakSelf,weakSelf,&weakSelf);
//
//        NSLog(@"%@",[weakSelf valueForKey:@"retainCount"]);
        //        str = @"dd";
//        NSLog(@"静态区/全局区 常量字符串地址：%p",str1);//常量字符串，存在常量区
//        str1 = @"gg";
//        NSLog(@"静态区/全局区 常量字符串地址：%p",str1);//常量字符串，存在常量区
//        mString = [NSMutableString stringWithFormat:@"gg"];
//        self.mString = [NSMutableString stringWithFormat:@"yyy"];
//        NSLog(@"堆区局部变量地址：%p",mString);
//        [mString appendString:@"jj"];
//        NSLog(@"堆区局部变量地址：%p",mString);
        
        
    };
    NSLog(@"引用基本数据类型的block地址：%p---%p--%p",blo2,&blo2,self.myBlock);
    
    NSLog(@"部%@----%p---%p",mString,mString,&mString);
//    NSLog(@"%@",[self valueForKey:@"retainCount"]);
    blo2();
//    blo2 = nil;
    self.myBlock = blo2;
    NSLog(@"引用基本数据类型的block地址：%p---%p---%p",blo2,&blo2,self.myBlock);

//    NSLog(@"%@",[self valueForKey:@"retainCount"]);
//    NSLog(@"%d----%p---%p",i,i,&i);
//    NSLog(@"%@----%p---%p",str,str,&str);
//    NSLog(@"%@----%p---%p",str1,str1,&str1);
//    NSLog(@"%@----%p---%p",mString,mString,&mString);
//    NSLog(@"%@----%p---%p",self,self,&self);
//    NSLog(@"%@----%p---%p",self.mString,self.mString,&self->_mString);
    
    someBlock blo3 =^{
//        [mString appendString:@"d"];
//        NSLog(@"%p---%@",mString,mString);
//        NSLog(@"%p------%@",str1,str1);
//        mString = [NSMutableString stringWithFormat:@"dddd"];
         NSLog(@"%p------%@",str,str);
    };
    NSLog(@"引用局部变量的block地址：%p",blo3);
    
    
    someBlock blo4 =^{
        
        NSLog(@"%@",weakSelf.mString);
    };
    NSLog(@"引用self的block地址：%p",blo4);
    
    
//    测试block内部捕获局部变量，在没有__block修饰的情况是传值还是传地址
//    测试发现基本数据类型局部变量传递的是值，而对象传递的是地址 如果是传值，那么两个i地址应该不一样了
    [mString appendString:@"bc"];
    i = i+5;

    
//    blo3();
    
    

}

- (void)testCopyFunction{
//    NSArray *arr = @[@"1",@"2"];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
     NSLog(@"%@",[arr class]);
    self.mArray = arr;
     NSLog(@"%@",[self.mArray class]);
    
    [self.mArray insertObject:@"3" atIndex:0];
     NSLog(@"%@",self.mArray);
}
- (void)testAssignFunction{
    Person *p =[self getPerson];
    self.p = p;
    NSLog(@"%@",[p valueForKey:@"retainCount"]);
    NSLog(@"%@",@"1111111");
     NSLog(@"%@",self.p);
}
- (void)testKVCFunction{
    Person *p  = [Person new];
    NSLog(@"%@",[self.p valueForKey:@"retainCount"]);
    self.p  = p;
    NSLog(@"%@",[self.p valueForKey:@"retainCount"]);
    
    
    [p setValue:@"name2" forKey:@"name"];
    p.age = 19;
    
    [p setValue:@20 forKey:@"age"];
    
    NSLog(@"%@",[p valueForKey:@"name"]);
    
}
- (Person *)getPerson{
    Person *p  = [Person new];
    
    
    
    [p setValue:@"name2" forKey:@"name"];
    p.age = 19;
    [p setValue:@20 forKey:@"age"];
    return p;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
