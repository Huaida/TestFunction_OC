//
//  HDStringCalculationViewController.m
//  TestFunction
//
//  Created by Cage on 2021/8/31.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDStringCalculationViewController.h"
#import "HDHomeTableView.h"

@interface HDStringCalculationViewController ()<HDHomeTableViewProtocol>
@property (nonatomic, strong) HDHomeTableView *tableView ;
@end

@implementation HDStringCalculationViewController

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
    self.tableView = [[HDHomeTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.selectedDelegate = self;
    NSArray *data = @[@[@"0 用于测试方法",@"HDFunctionViewController"],
                      @[@"1 String",@""],
                      @[@"2 动态绑定方法",@""],
                      @[@"3 红包数据页封装",@"HDRedEnvelopeViewController"],
                       @[@"4 自定义NavigationBar",@"HDTestNavigationBarViewController"],
                      @[@"5 异步多弹窗排序算法",@"HDShowAsynchronismViewViewController"],
                      @[@"6 暖场广告图",@"HDShowADViewsViewController"],
                      @[@"7 网络下载ZIP解压 文件及文件夹操作",@"HDDownloadAnimationViewController"],
                      @[@"8 自定义tableView测试",@"HDCustomTableViewController"],
                      @[@"9 原生与JS交互",@"HDOC_JSInteractionViewController"],
                      @[@"10 信号量测试",@"HDSignalViewController"],
                      @[@"11 国际化测试",@"HDChangeLanguageViewController"],
                      @[@"12 仿知乎页面切换",@"HDPageSwitchZHIHUViewController"],
                      @[@"13 子线程处理string计算，加千分位符",@"HDPageSwitchZHIHUViewController"],
                      @[@"0 用于测试方法",@"HDFunctionViewController"],
                                         @[@"1 String",@""],
                                         @[@"2 动态绑定方法",@""],
                                         @[@"3 红包数据页封装",@"HDRedEnvelopeViewController"],
                                          @[@"4 自定义NavigationBar",@"HDTestNavigationBarViewController"],
                                         @[@"5 异步多弹窗排序算法",@"HDShowAsynchronismViewViewController"],
                                         @[@"6 暖场广告图",@"HDShowADViewsViewController"],
                                         @[@"7 网络下载ZIP解压 文件及文件夹操作",@"HDDownloadAnimationViewController"],
                                         @[@"8 自定义tableView测试",@"HDCustomTableViewController"],
                                         @[@"9 原生与JS交互",@"HDOC_JSInteractionViewController"],
                                         @[@"10 信号量测试",@"HDSignalViewController"],
                                         @[@"11 国际化测试",@"HDChangeLanguageViewController"],
                                         @[@"12 仿知乎页面切换",@"HDPageSwitchZHIHUViewController"],
                                         @[@"13 子线程处理string计算，加千分位符",@"HDPageSwitchZHIHUViewController"],
                      @[@"0 用于测试方法",@"HDFunctionViewController"],
                                         @[@"1 String",@""],
                                         @[@"2 动态绑定方法",@""],
                                         @[@"3 红包数据页封装",@"HDRedEnvelopeViewController"],
                                          @[@"4 自定义NavigationBar",@"HDTestNavigationBarViewController"],
                                         @[@"5 异步多弹窗排序算法",@"HDShowAsynchronismViewViewController"],
                                         @[@"6 暖场广告图",@"HDShowADViewsViewController"],
                                         @[@"7 网络下载ZIP解压 文件及文件夹操作",@"HDDownloadAnimationViewController"],
                                         @[@"8 自定义tableView测试",@"HDCustomTableViewController"],
                                         @[@"9 原生与JS交互",@"HDOC_JSInteractionViewController"],
                                         @[@"10 信号量测试",@"HDSignalViewController"],
                                         @[@"11 国际化测试",@"HDChangeLanguageViewController"],
                                         @[@"12 仿知乎页面切换",@"HDPageSwitchZHIHUViewController"],
                                         @[@"13 子线程处理string计算，加千分位符",@"HDPageSwitchZHIHUViewController"],
                      @[@"0 用于测试方法",@"HDFunctionViewController"],
                                         @[@"1 String",@""],
                                         @[@"2 动态绑定方法",@""],
                                         @[@"3 红包数据页封装",@"HDRedEnvelopeViewController"],
                                          @[@"4 自定义NavigationBar",@"HDTestNavigationBarViewController"],
                                         @[@"5 异步多弹窗排序算法",@"HDShowAsynchronismViewViewController"],
                                         @[@"6 暖场广告图",@"HDShowADViewsViewController"],
                                         @[@"7 网络下载ZIP解压 文件及文件夹操作",@"HDDownloadAnimationViewController"],
                                         @[@"8 自定义tableView测试",@"HDCustomTableViewController"],
                                         @[@"9 原生与JS交互",@"HDOC_JSInteractionViewController"],
                                         @[@"10 信号量测试",@"HDSignalViewController"],
                                         @[@"11 国际化测试",@"HDChangeLanguageViewController"],
                                         @[@"12 仿知乎页面切换",@"HDPageSwitchZHIHUViewController"],
                                         @[@"13 子线程处理string计算，加千分位符",@"HDPageSwitchZHIHUViewController"],
    ];
    
    [self.tableView addDataToTableView:[data mutableCopy]];
}


- (void)homeTableViewDidSelectedRowWithClassName:(NSString *)classNameString{
    
}
@end
