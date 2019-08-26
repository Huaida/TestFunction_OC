//
//  HDAutoADScrollView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADScrollView.h"
#import "HDAutoADTableView.h"
@interface HDAutoADScrollView()
@property (nonatomic ,strong) HDAutoADTableView *tableView;
@property (nonatomic ,strong) UIPageControl *pageControl;

@end
@implementation HDAutoADScrollView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setBaseProperty];
    }
    return self;
}
- (void)setBaseProperty{
    self.tableView = [[HDAutoADTableView alloc] init];
    [self addSubview:self.tableView];
    self.pageControl = [[UIPageControl alloc] init];
    [self addSubview:self.pageControl];
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self updateTableView:dataArray];
    
    
}
- (void)updateTableView:(NSArray *)dataArray{
    self.tableView.frame = self.bounds;
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.dataArray = dataArray;
}
@end
