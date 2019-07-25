//
//  HDNavigartionBarPresenter.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>





@protocol  HDNavigartionBarPresenterProtocol<NSObject>
// loading
- (void)presenterStartLoading;
- (void)presenterEndLoading;
// 加载数据
-(void)presenterLoadDataSuccess:(NSMutableArray *)dataArray;
-(void)presenterLoadDataError:(NSError *)error;

@end

@interface HDNavigartionBarPresenter : NSObject

- (instancetype)initWithDelegate:(id<HDNavigartionBarPresenterProtocol>) delegate;
- (void)presenterLoadData;


@end
