//
//  HDTestNavigationBarViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/17.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDTestNavigationBarViewController.h"

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
    self.title = @"TestNavigationBar";
    
    
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
    pushButton.titleLabel.text = @"push button";
}
- (void)pushButtonDidClick{
    [self.navigationController pushViewController:[[HDTestNavigationBarViewController alloc] init] animated:YES];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBar.hidden = NO;
}
- (void)testFunction{
//     NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//    self.navigationController.navigationBar.translucent = NO;// 最上层view是否有透明度
    
    UINavigationBar *bar = self.navigationController.navigationBar;
//    调整navigationBar颜色
//    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor]; //bar的颜色不直接决定外观
    
//    调整title样式
//    样式
    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[UIColor purpleColor] forKey:NSForegroundColorAttributeName];
//    [dic setObject:[UIFont fontWithName:@"PingFangSC-Medium" size: 20] forKey:NSFontAttributeName];
//    [self.navigationController.navigationBar setTitleTextAttributes:dic];
//    位置
//    不能直接控制title的frame 只能用titleView自定义中间的样式
//    不能修改当前的title 修改的是前一个页面的title
//    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//    centerView.backgroundColor = [UIColor purpleColor];
//
//    UILabel *newTitle =[[ UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
//    [centerView addSubview:newTitle];
//    newTitle.text = @"new Title";
//
//    bar.topItem.titleView = centerView;

    
    

    
//    调整左右Item的位置以及样式
//    调整items颜色
    bar.tintColor = [UIColor greenColor];
//    items指的是左右端展示的按钮 这些items表示的导航过程中前面一整串的中间标题的位置
    NSLog(@"%@",bar.items);
    
    UINavigationBar *newbar1 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 100, MZ_SW-200, 20)];
    UINavigationItem *item1 =[[UINavigationItem alloc] initWithTitle:@"new item"];
    [newbar1 pushNavigationItem:item1 animated:YES];
    [self.view addSubview:newbar1];
    
    UINavigationBar *newbar2 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 200, MZ_SW-100, 20)];
    UINavigationItem *item2 =[[UINavigationItem alloc] initWithTitle:@"new item"];
    [newbar2 pushNavigationItem:item2 animated:YES];
    [self.view addSubview:newbar2];
    
    UINavigationBar *newbar3 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 300, MZ_SW, 20)];
    UINavigationItem *item3 =[[UINavigationItem alloc] initWithTitle:@"new item"];
    [newbar3 pushNavigationItem:item3 animated:YES];
    [self.view addSubview:newbar3];
//    Cannot call pushNavigationItem:animated: directly on a UINavigationBar managed by a controller.'
//    [bar popNavigationItemAnimated:YES];
    
//    [newbar pushNavigationItem:item animated:YES];
//    self.navigationController.navigationBar  = newbar;
    
    
    
//    添加多个bar测试
//    UINavigationBar *bar1 = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    
    
}
@end
