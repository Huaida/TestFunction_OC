//
//  HDADScrollView.h
//  huaida
//
//  Created by 怀达 on 2019/7/12.
//  Copyright © 2019 www.huaida.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HDADScrollViewProtocol <NSObject>

- (void)ADScrollViewCurrentPages:(NSInteger)pages;

@end
@interface HDADScrollView : UIScrollView
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic ,weak) id<HDADScrollViewProtocol> scrollDelegate;
@end

NS_ASSUME_NONNULL_END
