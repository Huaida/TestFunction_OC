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
    self.dataArray = @[@[@"iPhone X 适配",@""],
                       @[@"String",@""],
                       @[@"动态绑定方法",@""],
                       @[@"红包数据页封装",@"HDRedEnvelopeViewController"],
                        @[@"自定义NavigationBar",@"HDTestNavigationBarViewController"],
                       @[@"异步多弹窗排序算法",@"HDShowAsynchronismViewViewController"],
                       @[@"暖场广告图",@"HDShowADViewsViewController"],
                       
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
