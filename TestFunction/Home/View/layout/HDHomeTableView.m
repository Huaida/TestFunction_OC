//
//  HDHomeTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomeTableView.h"
#import "HDHomePresenter.h"



@interface HDHomeTableView ()<UITableViewDataSource>
//@property (nonatomic ,strong) HDHomePresenter *presenter;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end
@implementation HDHomeTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  == [super initWithFrame:frame]) {
        self.dataSource = self;
    }
    return self;
}
- (void)addDataToTableView:(NSMutableArray *)dataArray;{
    self.dataArray = dataArray;
    [self reloadData];
}
#pragma mark - datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = self.dataArray[indexPath.row];
    [cell addSubview:titleLabel];
    return cell;
}

@end
