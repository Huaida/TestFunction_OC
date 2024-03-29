//
//  HDStringCalculationViewController.m
//  TestFunction
//
//  Created by Cage on 2021/8/31.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDStringCalculationViewController.h"
//#import "HDHomeTableView.h"
#import "HDStringCalculateTableView.h"

@interface HDStringCalculationViewController ()<HDStringCalculateTableViewProtocol>
@property (nonatomic, strong) HDStringCalculateTableView *tableView ;
@property (nonatomic, strong) UIView *maskView ;
@end

@implementation HDStringCalculationViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:maskView];
    self.maskView = maskView;
    maskView.backgroundColor = [UIColor greenColor];
    maskView.alpha = 0;
    
    
    self.view.maskView = maskView;
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:10 animations:^{
        self.maskView.alpha = 1;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBaseProperty];
    [self customAddSubviews];
}
- (void)setBaseProperty{
    self.title = @"HOME";
    self.view.backgroundColor = [UIColor whiteColor];
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    
}
- (void)customAddSubviews{
    self.tableView = [[HDStringCalculateTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.selectedDelegate = self;
    NSArray *data = @[@[@"0 用于测试方法",@"45252525"],
                      @[@"1 String",@"24252.2525"],
                      @[@"2 动态绑定方法",@"36363.7785"],
                      @[@"3 红包数据页封装",@"366.3763552353"],
                       @[@"4 自定义NavigationBar",@"363337367.355353"],
                      @[@"5 异步多弹窗排序算法",@"3536367.774874"],
                      @[@"6 暖场广告图",@"356363636.377477"],
                      @[@"7 网络下载ZIP解压 文件及文件夹操作",@"3663737.747477"],
                      @[@"8 自定义tableView测试",@"3366737.3637"],
                      @[@"9 原生与JS交互",@"3737777.84887"],
                      @[@"10 信号量测试",@"3774747.847999"],
                      @[@"11 国际化测试",@"474747.748846"],
                      @[@"12 仿知乎页面切换",@"536363.746474"],
                      @[@"13 子线程处理string计算，加千分位符",@"366224.636377"],
                      @[@"0 用于测试方法",@"43536.47774"],
                                         @[@"1 String",@"25.888888"],
                                         @[@"2 动态绑定方法",@"4253636.374777"],
                                         @[@"3 红包数据页封装",@"1.33"],
                                          @[@"4 自定义NavigationBar",@"1.222"],
                                         @[@"5 异步多弹窗排序算法",@"574747.474747"],
                                         @[@"6 暖场广告图",@"442525.26663636"],
                                         @[@"7 网络下载ZIP解压 文件及文件夹操作",@"756355.6363"],
                                         @[@"8 自定义tableView测试",@"424255.7477"],
                                         @[@"9 原生与JS交互",@"5535353.367477"],
                                         @[@"10 信号量测试",@"42526.6774"],
                                         @[@"11 国际化测试",@"42562.6777"],
                                         @[@"12 仿知乎页面切换",@"3345.6677"],
                                         @[@"13 子线程处理string计算，加千分位符",@"353636.74774"],
                      @[@"0 用于测试方法",@"25566.778"],
                                         @[@"1 String",@"23566.788885"],
                                         @[@"2 动态绑定方法",@"255353.74757"],
                                         @[@"3 红包数据页封装",@"234525.63477"],
                                          @[@"4 自定义NavigationBar",@"253354.7475"],
                                         @[@"5 异步多弹窗排序算法",@"34536.57856"],
                                         @[@"6 暖场广告图",@"353637.74745"],
                                         @[@"7 网络下载ZIP解压 文件及文件夹操作",@"4775868.86979"],
                                         @[@"8 自定义tableView测试",@"24242.47558"],
                                         @[@"9 原生与JS交互",@"35367.7585"],
                      @[@"1 String",@"25.888888"],
                      @[@"2 动态绑定方法",@"4253636.374777"],
                      @[@"3 红包数据页封装",@"1.33"],
                       @[@"4 自定义NavigationBar",@"1.222"],
                      @[@"5 异步多弹窗排序算法",@"574747.474747"],
                      @[@"6 暖场广告图",@"442525.26663636"],
                      @[@"7 网络下载ZIP解压 文件及文件夹操作",@"756355.6363"],
                      @[@"8 自定义tableView测试",@"424255.7477"],
                      @[@"9 原生与JS交互",@"5535353.367477"],
                      @[@"10 信号量测试",@"42526.6774"],
                      @[@"11 国际化测试",@"42562.6777"],
                      @[@"12 仿知乎页面切换",@"3345.6677"],
                      @[@"13 子线程处理string计算，加千分位符",@"353636.74774"],
   @[@"0 用于测试方法",@"25566.778"],
                      @[@"1 String",@"23566.788885"],
                      @[@"2 动态绑定方法",@"255353.74757"],
                      @[@"3 红包数据页封装",@"234525.63477"],
                       @[@"4 自定义NavigationBar",@"253354.7475"],
                      @[@"5 异步多弹窗排序算法",@"34536.57856"],
                      @[@"6 暖场广告图",@"353637.74745"],
                      @[@"7 网络下载ZIP解压 文件及文件夹操作",@"4775868.86979"],
                      @[@"8 自定义tableView测试",@"24242.47558"],
                      @[@"9 原生与JS交互",@"35367.7585"],
                      
                      @[@"1 String",@"25.888888"],
                      @[@"2 动态绑定方法",@"4253636.374777"],
                      @[@"3 红包数据页封装",@"1.33"],
                       @[@"4 自定义NavigationBar",@"1.222"],
                      @[@"5 异步多弹窗排序算法",@"574747.474747"],
                      @[@"6 暖场广告图",@"442525.26663636"],
                      @[@"7 网络下载ZIP解压 文件及文件夹操作",@"756355.6363"],
                      @[@"8 自定义tableView测试",@"424255.7477"],
                      @[@"9 原生与JS交互",@"5535353.367477"],
                      @[@"10 信号量测试",@"42526.6774"],
                      @[@"11 国际化测试",@"42562.6777"],
                      @[@"12 仿知乎页面切换",@"3345.6677"],
                      @[@"13 子线程处理string计算，加千分位符",@"353636.74774"],
   @[@"0 用于测试方法",@"25566.778"],
                      @[@"1 String",@"23566.788885"],
                      @[@"2 动态绑定方法",@"255353.74757"],
                      @[@"3 红包数据页封装",@"234525.63477"],
                       @[@"4 自定义NavigationBar",@"253354.7475"],
                      @[@"5 异步多弹窗排序算法",@"34536.57856"],
                      @[@"6 暖场广告图",@"353637.74745"],
                      @[@"7 网络下载ZIP解压 文件及文件夹操作",@"4775868.86979"],
                      @[@"8 自定义tableView测试",@"24242.47558"],
                      @[@"9 原生与JS交互",@"35367.7585"],
                      
    ];
    
    [self.tableView addDataToTableView:[data mutableCopy]];
}


- (void)homeTableViewDidSelectedRowWithClassName:(NSString *)classNameString{
    
}
@end
