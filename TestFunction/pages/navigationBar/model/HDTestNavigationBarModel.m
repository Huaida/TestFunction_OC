//
//  HDTestNavigationBarModel.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDTestNavigationBarModel.h"


@interface HDTestNavigationBarModel ()
@property (nonatomic ,weak) id<HDTestNavigationBarModelProtocol> delegate;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end
@implementation HDTestNavigationBarModel
- (instancetype)initWithDelegate:(id<HDTestNavigationBarModelProtocol>)delegate{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}
-(void)modelLoadData{
    //     加载数据 一般会在请求接口
    self.dataArray = @[@[@"[系统]透明渐变",@"HDNavBarOneViewController"],
                       @[@"[系统]颜色渐变",@"HDNavBarTwoViewController"],
                       @[@"[系统]",@"HDNavBarThreeViewController"],
                       @[@"[自定义]导航栏",@"HDNavBarFourViewController"],
                       
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
