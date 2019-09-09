//
//  MZHorizontalScrollTableViewCell.h
//  TestFunction
//
//  Created by 怀达 on 2019/9/6.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MZHorizontalScrollTableViewCell : UITableViewCell
@property (nonatomic ,strong) NSArray *dataArray;
- (void)updateUI;
@end

NS_ASSUME_NONNULL_END
