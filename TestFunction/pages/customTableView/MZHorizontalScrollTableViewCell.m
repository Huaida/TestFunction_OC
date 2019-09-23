//
//  MZHorizontalScrollTableViewCell.m
//  TestFunction
//
//  Created by 怀达 on 2019/9/6.
//  Copyright © 2019 white. All rights reserved.
//
#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

#import "MZHorizontalScrollTableViewCell.h"
@interface MZHorizontalScrollTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation MZHorizontalScrollTableViewCell
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,];
    }
    return _dataArray;
}

- (void)updateUI;{
    self.backgroundColor = [UIColor cyanColor];
    [self customAddSubviews];
}
- (void)customAddSubviews{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MZ_SW, MZ_SH) style:UITableViewStylePlain];
    [self.contentView addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}





// 咱还是不用
- (void)customAddSubviews1{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(MZ_SW, 600);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,MZ_SW,600) collectionViewLayout:flowLayout];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"dequeueReusableCellWithReuseIdentifier"];
    self.backgroundColor = [UIColor greenColor];
    [self addSubview:self.collectionView];
}

#pragma mark - datasource & delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dequeueReusableCellWithReuseIdentifier" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc] initWithFrame:self.bounds];
    }
    cell.backgroundColor = FYRandomColor;
    for (UIView *sub in cell.contentView.subviews) {
        [sub removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    [cell.contentView addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%ld--%ld",(long)indexPath.section,(long)indexPath.row];
    return cell;
}

#pragma mark 嵌套滚动处理

- (void)setCellCanScroll:(BOOL)cellCanScroll
{
    _cellCanScroll = cellCanScroll;
    if (!cellCanScroll) {//如果cell不能滑动，代表到了顶部，修改所有子vc的状态回到顶部
        self.tableView.contentOffset = CGPointZero;
    }

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
@end
