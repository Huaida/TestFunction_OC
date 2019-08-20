//
//  HDGiveRedEnvelopePresenter.m
//  huaida
//
//  Created by 怀达 on 2019/7/8.
//  Copyright © 2019 www.huaida.com. All rights reserved.
//

#import "HDGiveRedEnvelopePresenter.h"
#import "HDRedEnvelopeErrorModel.h"
@interface HDGiveRedEnvelopePresenter()
@property (nonatomic ,weak) id<HDGiveRedEnvelopePresenterProtocol> delegate;


@end
@implementation HDGiveRedEnvelopePresenter

- (instancetype)initWithDelegate:(id<HDGiveRedEnvelopePresenterProtocol>) delegate;{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}

- (void)checkValidityWithMoney:(NSString *)money :(NSString *)count;{
    NSMutableArray *errorArray = [NSMutableArray new];
    CGFloat countNum = [count floatValue];
    double moneyNum = [money doubleValue];
    
//    1,依次判断各个类型的错误
    if (countNum > 100) {
        [errorArray addObject:[HDRedEnvelopeErrorModel numberError]];
    }
    
    if (countNum >=1 && moneyNum >= 0.01) {
        
        if (moneyNum/countNum > 200) {
            [errorArray addObject:[HDRedEnvelopeErrorModel perRedEnvelopeErrorMore]];
        }
        
        if (moneyNum/countNum < 0.01) {
            [errorArray addObject:[HDRedEnvelopeErrorModel perRedEnvelopeErrorLess]];
        }
    }
    if (moneyNum > 20000) {
        [errorArray addObject:[HDRedEnvelopeErrorModel moneyError]];
    }
//    2，对已有的错误排序
    NSArray *sortArray = [errorArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        HDRedEnvelopeErrorModel *model1 = obj1;
        HDRedEnvelopeErrorModel *model2 = obj2;
        if (model1.weight < model2.weight) return NSOrderedDescending;
        return NSOrderedAscending;
    }];
    NSLog(@"sortArray: \n %@",sortArray);
//    3，展示权重最大的错误
    if (sortArray.count>0) {
        
        HDRedEnvelopeErrorModel *resultModel = sortArray.firstObject;
        [self showRedViewWith:resultModel.errorHint];
        [self moneyLegal:resultModel.moneyLegal];
        [self numLegal:resultModel.countLegal];
        
    }else{
        [self showRedViewWith:nil];
        [self moneyLegal:YES];
        [self numLegal:YES];
    }
}


- (void)checkValidityWithMoney:(NSString *)moneyString :(NSString *)countString isMoneyTextField:(BOOL)isMoneyTF;{
    
    CGFloat money = [moneyString floatValue];
    NSInteger count = [countString integerValue];
//    个数判断
    if (!isMoneyTF) {
        [self hd_checkValidityForNumTextFieldWithMoney:money :count];
//        金额判断
    }else if (isMoneyTF) {
        [self hd_checkValidityForMoneyTextFieldWithMoney:money :count];
    }

}
- (void)hd_checkValidityForNumTextFieldWithMoney:(CGFloat)money :(NSInteger)count {
    //            单独判断 个数
    if (count > 100) {
        [self moneyLegal:YES];
        [self numLegal:NO];
        [self showRedViewWith:@"一次最多发100个红包"];
        
    }else if(count ==0){
        //            单独判断金额
        if (money > 20000.00) {
            [self moneyLegal:NO];
            [self showRedViewWith:@"总额不可超过20000元"];
        }else {
            [self moneyLegal:YES];
            [self showRedViewWith:nil];
        }
        
    }else{
        [self numLegal:YES];
        [self showRedViewWith:nil];
        if (money > 0.00) {
            if((money / (count * 1.0) > 200.00) ||
               (money/ (count * 1.0) < 0.5)){
                
                [self moneyLegal:NO];
                [self showRedViewWith:@"单个红包金额不超过200元，不少于0.5元"];
            }else {
                [self moneyLegal:YES];
                [self showRedViewWith:nil];
            }
        }
    }
}
- (void)hd_checkValidityForMoneyTextFieldWithMoney:(CGFloat)money :(NSInteger)count {
    if (count == 0) { // 个数还未输入
        //  单独判断金额
        if (money > 20000.00) {
            [self moneyLegal:NO];
            [self showRedViewWith:@"总额不可超过20000元"];
        }else {
            [self moneyLegal:YES];
            [self showRedViewWith:nil];
        }
    }else {
        // 有数量
        if(count > 100){
            //          个数优先级最高 不需要再考虑金额
            
        }else if (money == 0){
            [self moneyLegal:YES];
            [self showRedViewWith:nil];
        }else{
            if ((money/ (count * 1.0) > 200.00) ||
                (money / (count * 1.0) < 0.5)) {
                [self moneyLegal:NO];
                [self showRedViewWith:@"单个红包金额不超过200元，不少于0.5元"];
            }else{
                [self moneyLegal:YES];
                [self showRedViewWith:nil];
            }
        }
        
    }
}
- (void)numLegal:(BOOL)legal{
    if (legal) {
        [self.delegate giveRedEnvelopePresenterNumTextFieldIsLegal:YES];
    }else{
        [self.delegate giveRedEnvelopePresenterNumTextFieldIsLegal:NO];
    }
}
- (void)moneyLegal:(BOOL)legal{
    if (legal) {
        [self.delegate giveRedEnvelopePresenterMoneyTextFieldIsLegal:YES];
    }else{
        [self.delegate giveRedEnvelopePresenterMoneyTextFieldIsLegal:NO];
    }
}
- (void)showRedViewWith:(NSString *)alertString{
    [self.delegate giveRedEnvelopePresenterShowAlertViewWithString:alertString];
}
@end
