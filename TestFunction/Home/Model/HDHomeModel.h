//
//  HDHomeModel.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  HDHomeModelProtocol <NSObject>
- (void)modelLoadDataSuccess:(NSMutableArray *)dataArray;
@end


@interface HDHomeModel : NSObject
@property (nonatomic ,copy) NSString *titleString;

- (instancetype)initWithDelegate:(id<HDHomeModelProtocol>) delegate;
- (void)modelLoadData;
@end


