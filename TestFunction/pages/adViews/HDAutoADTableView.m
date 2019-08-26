//
//  HDAutoADTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADTableView.h"
@interface HDAutoADTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HDAutoADTableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setBaseProperty];
    }
    return self;
}
- (void)setBaseProperty{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.dataSource = self;
    self.delegate = self;
    self.pagingEnabled = YES;
    self.bounces = NO;
//    self.estimatedRowHeight = MZ_SW;
//    设置横向滚动
    self.transform = CGAffineTransformMakeRotation(-M_PI / 2);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    //对Cell要做的设置
    
    cell.textLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    cell.textLabel.text= @"tableview竖向滚动";
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MZ_SW;
}
#pragma mark - setter
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
//    [self reloadData];
}

@end
