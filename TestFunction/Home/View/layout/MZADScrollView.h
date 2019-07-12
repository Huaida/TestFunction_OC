//
//  MZADScrollView.h
//  MengZhu
//
//  Created by 怀达 on 2019/7/12.
//  Copyright © 2019 www.mengzhu.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MZADScrollViewProtocol <NSObject>

- (void)ADScrollViewCurrentPages:(NSInteger)pages;

@end
@interface MZADScrollView : UIScrollView
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic ,weak) id<MZADScrollViewProtocol> scrollDelegate;
@end

NS_ASSUME_NONNULL_END
