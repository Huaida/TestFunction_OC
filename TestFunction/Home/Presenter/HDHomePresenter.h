//
//  HDHomePresenter.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  HDHomePresenterProtocol<NSObject>
// loading
- (void)presenterStartLoading;
- (void)presenterEndLoading;
// 加载数据
-(void)presenterLoadDataSuccess:(NSMutableArray *)dataArray;
-(void)presenterLoadDataError:(NSError *)error;

@end

@interface HDHomePresenter : NSObject

- (instancetype)initWithDelegate:(id<HDHomePresenterProtocol>) delegate;
- (void)presenterLoadData;


@end
