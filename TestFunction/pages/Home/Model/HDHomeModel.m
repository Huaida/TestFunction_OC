//
//  HDHomeModel.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomeModel.h"

@interface HDHomeModel ()
@property (nonatomic ,weak) id<HDHomeModelProtocol> delegate;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end
@implementation HDHomeModel
- (instancetype)initWithDelegate:(id<HDHomeModelProtocol>)delegate{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}
-(void)modelLoadData{
//     加载数据 一般会在请求接口
    self.dataArray = @[@[@"0 用于测试方法",@"HDFunctionViewController"],
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
                       ].mutableCopy;
    
    [self.delegate modelLoadDataSuccess:self.dataArray];
}
#pragma mark - getter
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
