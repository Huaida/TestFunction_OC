//
//  HDStringCalculateCell.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDStringCalculateCell : UITableViewCell
@property (nonatomic ,strong) UILabel *cellTitleLabel;// 显示名称
@property (nonatomic ,copy)  NSString *number;
@property (nonatomic, strong) NSArray *dataArray ;
@end

NS_ASSUME_NONNULL_END
