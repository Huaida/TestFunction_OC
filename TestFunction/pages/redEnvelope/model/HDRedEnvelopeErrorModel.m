//
//  HDRedEnvelopeErrorModel.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDRedEnvelopeErrorModel.h"

@implementation HDRedEnvelopeErrorModel
+ (instancetype)numberError;{
    HDRedEnvelopeErrorModel *model = [HDRedEnvelopeErrorModel new];
    model.weight = 10000;
    model.errorHint = @"一次最多发100个红包";
    model.moneyLegal = YES;
    model.countLegal = NO;
    return model;
}
+ (instancetype)moneyError;{
    HDRedEnvelopeErrorModel *model = [HDRedEnvelopeErrorModel new];
    model.weight = 100;
    model.errorHint = @"单次支付总额不可超过20000元";
    model.moneyLegal = NO;
    model.countLegal = YES;
    return model;
}
+ (instancetype)perRedEnvelopeErrorMore;{
    HDRedEnvelopeErrorModel *model = [HDRedEnvelopeErrorModel new];
    model.weight = 1000;
    model.errorHint = @"单个红包金额不可超过200元";
    model.moneyLegal = NO;
    model.countLegal = NO;
    return model;
}
+ (instancetype)perRedEnvelopeErrorLess;{
    HDRedEnvelopeErrorModel *model = [HDRedEnvelopeErrorModel new];
    model.weight = 1000;
    model.errorHint = @"单个红包金额不可低于0.01元";
    model.moneyLegal = NO;
    model.countLegal = NO;
    return model;
}
@end
