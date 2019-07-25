//
//  HDNavigartionBarPresenter.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNavigartionBarPresenter.h"
#import "HDTestNavigationBarModel.h"


@interface HDNavigartionBarPresenter()<HDTestNavigationBarModelProtocol>
@property (nonatomic ,weak) id<HDNavigartionBarPresenterProtocol> delegate;
@property (nonatomic ,strong) HDTestNavigationBarModel *model;
@end

@implementation HDNavigartionBarPresenter
-(instancetype)initWithDelegate:(id<HDNavigartionBarPresenterProtocol>)delegate{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}
- (void)presenterLoadData;{
    //    model组数据
    self.model = [[HDTestNavigationBarModel alloc] initWithDelegate:self];
    [self.model modelLoadData];
}
#pragma mark - model delegate
- (void)modelLoadDataSuccess:(NSMutableArray *)dataArray{
    [self.delegate presenterLoadDataSuccess:dataArray];
}
@end
