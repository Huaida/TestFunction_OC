//
//  HDTestNavigationBarViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/17.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDTestNavigationBarViewController.h"
#import "HDRedEnvelopeViewController.h"
@interface HDTestNavigationBarViewController ()

@end

@implementation HDTestNavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseProperty];
    [self customAddSubviews];
    
    [self testFunction];
}
- (void)setBaseProperty{
    self.view.backgroundColor = [UIColor redColor];
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.title = @"Bar";
    
    
}
- (void)customAddSubviews{
    UILabel *testTransparenceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MZ_SW, 44)];
    testTransparenceLabel.text = @"测试透明";
    testTransparenceLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:testTransparenceLabel];
    
    UIButton *pushButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 500, MZ_SW, 50)];
    [self.view addSubview:pushButton];
    pushButton.backgroundColor = [UIColor grayColor];
    [pushButton addTarget:self action:@selector(pushButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    [pushButton setTitle:@"push button" forState:UIControlStateNormal];
}
- (void)pushButtonDidClick{
    [self.navigationController pushViewController:[[HDRedEnvelopeViewController alloc] init] animated:YES];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = MakeColorRGBA(0xEFCE73, 1);
    self.title = @"bar title";
}
- (void)testFunction{
    
    UINavigationBar *newbar1 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 100, MZ_SW-200, 20)];
    UINavigationItem *item1 =[[UINavigationItem alloc] initWithTitle:@"UIBarStyleDefault"];
    [newbar1 pushNavigationItem:item1 animated:YES];
    [self.view addSubview:newbar1];
    newbar1.backgroundColor = [UIColor purpleColor];
    
//    替换bar
//    self.navigationController.navigationBar = newbar1;
    
//
//    UINavigationBar *newbar2 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 200, MZ_SW-100, 20)];
//    UINavigationItem *item2 =[[UINavigationItem alloc] initWithTitle:@"UIBarStyleBlack"];
//    [newbar2 pushNavigationItem:item2 animated:YES];
//    [self.view addSubview:newbar2];
//    newbar2.barStyle = UIBarStyleBlack;
//    newbar2.backgroundColor = [UIColor purpleColor];
//
//    UINavigationBar *newbar3 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 300, MZ_SW, 20)];
//    UINavigationItem *item3 =[[UINavigationItem alloc] initWithTitle:@"UIBarStyleBlack translucent = NO "];
//    [newbar3 pushNavigationItem:item3 animated:YES];
//    [self.view addSubview:newbar3];
//    newbar3.barStyle = UIBarStyleBlack;
//    newbar3.translucent = NO;
//    newbar3.backgroundColor = [UIColor purpleColor];
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    
    NSLog(@"%@---%@",bar,NSStringFromCGRect(bar.frame));
    bar.barStyle = UIBarStyleDefault;
    
#pragma mark  -    调整navigationBar
    
    bar.translucent = YES;// 最上层view是否有透明度
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgImage"] forBarMetrics:UIBarMetricsDefault];//给导航条设置背景图片
    
//    bar.backgroundColor = [UIColor greenColor]; //bar的颜色不直接决定外观
//    bar.barTintColor = [UIColor purpleColor];  // 改变bar的颜色
    
//    渐变色的控制
//    在viewWillAppear中添加相关设置颜色方法，会自动进行颜色渐变。
    
//    透明
    // 导航栏背景透明度设置
    
//   1， 通过设置背景图为nil，如果图像为空[UIImage imageNamed:@""];也能让背景透明，但是push之后的控制器导航栏会卡一下。
    
//    UIView *barBackgroundView = [[self.navigationController.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
//    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
//    if (bar.isTranslucent) {
//        if (backgroundImageView != nil && backgroundImageView.image != nil) {
//            barBackgroundView.alpha = 0;
//        } else {
//            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
//            if (backgroundEffectView != nil) {
//                backgroundEffectView.alpha = 0;
//            }
//        }
//    } else {
//        barBackgroundView.alpha = 0;
//    }
////    对导航栏下面那条线做处理
//    bar.clipsToBounds = YES ;
//    互不影响的控制
//    如果是隐藏naviBar 自己添加view的话可以达到效果
    
    
#pragma mark  -    调整title
//    self.navigationItem.title = @"test";
//    样式
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIColor purpleColor] forKey:NSForegroundColorAttributeName];
//    [dic setObject:[UIFont fontWithName:@"PingFangSC-Medium" size: 20] forKey:NSFontAttributeName];
//    [self.navigationController.navigationBar setTitleTextAttributes:dic];
    
    
//    位置
//    不能直接控制title的frame 只能用titleView自定义中间的样式
//    UIView *titleView = self.navigationItem.titleView;
//    NSLog(@"%@",titleView);  // 不能获取当前的titleView 只可以赋值替换
    UILabel *testLabel = [[UILabel alloc] init];
    testLabel.text = @"testlabel";
    UILabel *testLabel1 = [[UILabel alloc] init];
    testLabel1.text = @"testlabel1";
    UILabel *testLabel2 = [[UILabel alloc] init];
    testLabel2.text = @"testlabel2";
    UILabel *testLabel3 = [[UILabel alloc] init];
    testLabel3.text = @"testlabel3";
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"一路發"]];
    self.navigationItem.titleView = testLabel;
    testLabel.frame =CGRectMake(0, 0, 10, 10);
// titleImageView 一定是居中的，frame的size修改在一定范围内是有效的 可以放大但是不能缩小
//    在自定义titleView时，可以先添加容器然后对内部进行控制
    
//    如果是图片作为titleView时，当该VC被成为第二位的VC时，左侧返回按钮显示的仍然是title内容
//    如果是label作为titleView时，当该VC被成为第二位的VC时，左侧返回按钮显示的仍然是title内容
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc] initWithCustomView:testLabel1];
    item1.leftBarButtonItem = leftItem1;
    
//    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc] initWithCustomView:testLabel2];
//    UIBarButtonItem *leftItem3 = [[UIBarButtonItem alloc] initWithCustomView:testLabel3];
    UIBarButtonItem *leftItem4 = [[UIBarButtonItem alloc] initWithCustomView:titleImageView];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        设置的新的item放到数组的顶部，会把原来的第一个位置替换掉
//        [self.navigationItem setLeftBarButtonItem:leftItem4 animated:YES];
//    });
//    self.navigationItem.leftBarButtonItems = @[leftItem1,leftItem2,leftItem3];
    
//   可以添加bar button item但是不能设置frame
    self.navigationItem.rightBarButtonItem = leftItem4;
    


#pragma mark  -    调整左右单个或者多个item的样式位置
//    调整左右Item的位置以及样式
//    调整items颜色
    bar.tintColor = [UIColor greenColor];
//    items指的是左右端展示的按钮 这些items表示的导航过程中前面一整串的中间标题的位置
    NSLog(@"%@",bar.items);
    
//    Cannot call pushNavigationItem:animated: directly on a UINavigationBar managed by a controller.'
//    [bar popNavigationItemAnimated:YES];
    
//    [bar pushNavigationItem:self.navigationItem animated:YES];
//    self.navigationController.navigationBar  = newbar;
    
    
    
//    添加多个bar测试
//    UINavigationBar *bar1 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    
//    总结
//    navigationBar的颜色，渐变，会比较容易控制，但隔离方式的切换还不知道如何用系统navigationBar控制，除非把navigationBar隐藏，自定义navigationBar。
//    title可以进行属性控制，但不能设置frame，具体位置与左右items数量，大小有关，默认是居中的。可以在中间放一个自定义view
    //    从设置上看，self.title会在默认影响下一个VC的leftButtonItem内容
//    当内容比较短时显示内容，内容较长时会用back代替
    
// 左右都可以添加多个UIBarButtonItem，可以是自定义view，但是frame无法控制。
    
//    从上述总结看，问题如下：
//    1，不能统一控制左右VC切换的样式  渐变 分离 透明度
//    2，titleView的frame 和 左右item的frame都无法自定义控制

    
}
@end
