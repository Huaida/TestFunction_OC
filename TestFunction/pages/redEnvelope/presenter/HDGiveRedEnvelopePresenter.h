//
//  HDGiveRedEnvelopePresenter.h
//  huaida
//
//  Created by 怀达 on 2019/7/8.
//  Copyright © 2019 www.huaida.com. All rights reserved.
//

#import <Foundation/Foundation.h>




@protocol  HDGiveRedEnvelopePresenterProtocol<NSObject>
- (void)giveRedEnvelopePresenterCanSubmit;
- (void)giveRedEnvelopePresenterCanNotSubmit;

- (void)giveRedEnvelopePresenterShowAlertViewWithString:(NSString *)alertString;

- (void)giveRedEnvelopePresenterMoneyTextFieldIsLegal:(BOOL)isLegal;
- (void)giveRedEnvelopePresenterNumTextFieldIsLegal:(BOOL)isLegal;

@end

@interface HDGiveRedEnvelopePresenter : NSObject

- (instancetype)initWithDelegate:(id<HDGiveRedEnvelopePresenterProtocol>) delegate;

- (void)checkValidityWithMoney:(NSString *)money :(NSString *)count isMoneyTextField:(BOOL)isMoneyTF;
- (void)checkValidityWithMoney:(NSString *)money :(NSString *)count;
@end


