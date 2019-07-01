//
//  TestOneModel.h
//  TestFunction
//
//  Created by 怀达 on 2019/4/19.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestTwoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestOneModel : NSObject
@property (nonatomic , copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic,strong) NSMutableString* level;
@property (nonatomic,strong) TestTwoModel *book;

@end

NS_ASSUME_NONNULL_END
