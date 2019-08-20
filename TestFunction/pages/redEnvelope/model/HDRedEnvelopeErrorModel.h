//
//  HDRedEnvelopeErrorModel.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDRedEnvelopeErrorModel : NSObject
@property (nonatomic,assign) NSInteger weight;
@property (nonatomic ,copy) NSString *errorHint;
@property (nonatomic,assign) BOOL moneyLegal;
@property (nonatomic,assign) BOOL countLegal;

+ (instancetype)numberError;
+ (instancetype)moneyError;
+ (instancetype)perRedEnvelopeErrorLess;
+ (instancetype)perRedEnvelopeErrorMore;

@end

NS_ASSUME_NONNULL_END
