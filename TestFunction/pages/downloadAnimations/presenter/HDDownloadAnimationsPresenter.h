//
//  HDDownloadAnimationsPresenter.h
//  TestFunction
//
//  Created by 怀达 on 2019/8/15.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HDDownloadAnimationPresenterProtocal <NSObject>

// 加载数据
-(void)presenterLoadDataSuccess;
-(void)presenterLoadDataError;

@end

@interface HDDownloadAnimationsPresenter : NSObject
- (instancetype)initWithDelegate:(id<HDDownloadAnimationPresenterProtocal>) delegate;
- (void)presenterLoadData;
@end


