//
//  HDTestNavigationBarModel.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/25.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol  HDTestNavigationBarModelProtocol <NSObject>
- (void)modelLoadDataSuccess:(NSMutableArray *)dataArray;
@end


@interface HDTestNavigationBarModel : NSObject
@property (nonatomic ,copy) NSString *titleString;

- (instancetype)initWithDelegate:(id<HDTestNavigationBarModelProtocol>) delegate;
- (void)modelLoadData;
@end
