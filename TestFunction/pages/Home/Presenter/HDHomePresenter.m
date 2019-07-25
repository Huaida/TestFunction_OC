//
//  HDHomePresenter.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomePresenter.h"
#import "HDHomeModel.h"

@interface HDHomePresenter()<HDHomeModelProtocol>
@property (nonatomic ,weak) id<HDHomePresenterProtocol> delegate;
@property (nonatomic ,strong) HDHomeModel *model;
@end

@implementation HDHomePresenter
-(instancetype)initWithDelegate:(id<HDHomePresenterProtocol>)delegate{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}
- (void)presenterLoadData;{
//    model组数据
    self.model = [[HDHomeModel alloc] initWithDelegate:self];
    [self.model modelLoadData];
}
#pragma mark - model delegate
- (void)modelLoadDataSuccess:(NSMutableArray *)dataArray{
    [self.delegate presenterLoadDataSuccess:dataArray];
}
@end

