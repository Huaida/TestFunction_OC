//
//  HDHomeTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomeTableView.h"
#import "HDHomePresenter.h"
#import "HDHomeTableViewCell.h"


@interface HDHomeTableView ()<UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic ,strong) HDHomePresenter *presenter;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end
@implementation HDHomeTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  == [super initWithFrame:frame]) {
        self.dataSource = self;
        self.delegate = self;
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
    HDHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[HDHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.cellTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
    cell.cellTitleLabel.textAlignment = NSTextAlignmentCenter;
    cell.cellTitleLabel.text = self.dataArray[indexPath.row][0];
    [cell addSubview:cell.cellTitleLabel];
    cell.classNameString = self.dataArray[indexPath.row][1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HDHomeTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
     NSLog(@"%@",cell.classNameString);
    [self.selectedDelegate homeTableViewDidSelectedRowWithClassName:cell.classNameString];
}

@end
