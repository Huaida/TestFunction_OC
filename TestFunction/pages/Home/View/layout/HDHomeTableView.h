//
//  HDHomeTableView.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HDHomeTableViewProtocol <NSObject>

- (void)homeTableViewDidSelectedRowWithClassName:(NSString *)classNameString;

@end
NS_ASSUME_NONNULL_BEGIN

@interface HDHomeTableView : UITableView
@property (nonatomic ,weak) id<HDHomeTableViewProtocol> selectedDelegate;
- (void)addDataToTableView:(NSMutableArray *)dataArray;


@end

NS_ASSUME_NONNULL_END
