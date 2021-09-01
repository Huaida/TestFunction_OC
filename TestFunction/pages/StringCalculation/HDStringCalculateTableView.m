//
//  HDStringCalculateTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDStringCalculateTableView.h"
#import "HDStringCalculateCell.h"
#import "YYTimer.h"


@interface HDStringCalculateTableView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic, strong) YYTimer *timer ;
@end
@implementation HDStringCalculateTableView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  == [super initWithFrame:frame]) {
        self.dataSource = self;
        self.delegate = self;
        
        [self addTimer];
    }
    return self;
}
- (void)addTimer;{
     self.timer = [YYTimer timerWithTimeInterval:0.001 target:self selector:@selector(cellUpdate) repeats:YES];
}
- (void)cellUpdate{
    for (HDStringCalculateCell *cell in self.visibleCells) {
        cell.dataArray = cell.dataArray;
    }
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
    HDStringCalculateCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[HDStringCalculateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.dataArray = self.dataArray[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
