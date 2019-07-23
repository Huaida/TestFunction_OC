//
//  MZFullScreenViewModel.h
//  MengZhu
//
//  Created by 怀达 on 2019/7/22.
//  Copyright © 2019 www.mengzhu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Show_weight 10000
#define Show_weight_AD 10000
#define Show_weight_SignIn 1000
#define Show_weight_Prize 100
#define Show_weight_QR  10
NS_ASSUME_NONNULL_BEGIN

@interface MZFullScreenViewModel : NSObject
@property (nonatomic ,copy) NSString *selectorNameString;
// 广告 10000 签到 1000 中奖弹窗100 二维码 10
@property (nonatomic,assign) NSInteger weight;
+ (instancetype)fullScreenViewModelWithSelectorString:(NSString *)string weight:(NSInteger)weight;
@end

NS_ASSUME_NONNULL_END
