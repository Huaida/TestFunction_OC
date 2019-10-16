//
//  HDContainerCollectionViewCell.m
//  TestFunction
//
//  Created by Cage  on 2019/10/16.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDContainerCollectionViewCell.h"
@interface HDContainerCollectionViewCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataSource;
@property (nonatomic, assign) BOOL cellCanScroll;
@end
@implementation HDContainerCollectionViewCell
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2];
    }
    return _dataSource;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self customAddSubviews];
        [self addNotification];
    }
    return self;
}
-(void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollNotification:) name:@"cellCanScroll" object:nil];
}
-(void)scrollNotification:(NSNotification *)obj{
     NSLog(@"%@",obj);
    if([obj.object intValue]){
        self.cellCanScroll = YES;
    }else{
        self.cellCanScroll = NO;
    }
}
- (void)customAddSubviews{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    [self addSubview:tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HDContainerCollectionViewCelltestCell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HDContainerCollectionViewCelltestCell"];
    cell.backgroundColor = FYRandomColor;
    for (UIView *subview in cell.contentView.subviews) {
        [subview removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MZ_SW, 44)];
    [cell.contentView addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%ld--%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"innter %f",scrollView.contentOffset.y);
    if (!self.cellCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    if (scrollView.contentOffset.y <= 0) {
        
        self.cellCanScroll = NO;
        scrollView.contentOffset = CGPointZero;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];//到顶通知父视图改变状态
    }else{
        self.tableView.bounces = YES;
    }
    self.tableView.showsVerticalScrollIndicator = self.cellCanScroll?YES:NO;
}
- (void)setCellCanScroll:(BOOL)cellCanScroll
{
    _cellCanScroll = cellCanScroll;
    if (!cellCanScroll) {//如果cell不能滑动，代表到了顶部，修改所有子vc的状态回到顶部
        self.tableView.contentOffset = CGPointZero;
    }
    
}
@end
