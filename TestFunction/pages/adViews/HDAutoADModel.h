//
//  HDAutoADModel.h
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDCustomTextADModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HDAutoADModel : NSObject

@property (nonatomic,assign) int type;
@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,copy) NSString *link;
@property (nonatomic ,copy) HDCustomTextADModel *style;

@end

NS_ASSUME_NONNULL_END
