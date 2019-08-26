//
//  HDAutoADTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADTableView.h"
#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

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
    _dataArray = [NSMutableArray new];
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.dataSource = self;
    self.delegate = self;
    self.pagingEnabled = YES;
    self.bounces = NO;
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
    cell.backgroundColor = FYRandomColor;
    cell.textLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MZ_SW;
}
#pragma mark - setter
- (void)setDataArray:(NSMutableArray *)dataArray{
    
    for (int i = 0; i < 100; i ++) {
        [_dataArray addObjectsFromArray:dataArray];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:dataArray.count * 50 inSection:0];
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
        
    });
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.y);
}
@end
