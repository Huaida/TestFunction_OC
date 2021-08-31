//
//  HDStringCalculateTableView.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HDStringCalculateTableViewProtocol <NSObject>

- (void)homeTableViewDidSelectedRowWithClassName:(NSString *_Nullable)classNameString;

@end
NS_ASSUME_NONNULL_BEGIN

@interface HDStringCalculateTableView : UITableView
@property (nonatomic ,weak) id<HDStringCalculateTableViewProtocol> selectedDelegate;
- (void)addDataToTableView:(NSMutableArray *)dataArray;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
