//
//  MZCustomTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/9/6.
//  Copyright © 2019 white. All rights reserved.
//
#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define times 100

#import "MZCustomTableView.h"
#import "MZHorizontalScrollTableViewCell.h"
#import "MZSectionHeaderCollectionView.h"
@interface MZCustomTableView()<UITableViewDelegate,UITableViewDataSource,MZSectionHeaderCollectionViewProtocol>
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, strong) MZHorizontalScrollTableViewCell *contentCell;
@end
@implementation MZCustomTableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self == [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.canScroll = YES;
        self.bounces = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
        [self customAddHeaderView];
        [self registerClass:[MZHorizontalScrollTableViewCell class] forCellReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        [self registerClass:[MZHorizontalScrollTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MZHorizontalScrollTableViewCell class])];
    }
    return self;
}

- (void)customAddHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
    headerView.backgroundColor = [UIColor cyanColor];
    self.tableHeaderView = headerView;
}
#pragma mark - MZSectionHeaderCollectionView delegate
- (void)sectionHeaderCollectionViewDidSelectedIndex:(NSIndexPath *)index{
     NSLog(@"%@",index);
    
}
#pragma mark - UICollectionView dataSource & delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        MZSectionHeaderCollectionView *cView = [MZSectionHeaderCollectionView sectionHeaderFromData:@[@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,]];
        cView.sectionHeaderDelegate = self;
//        UILabel *label = [[UILabel alloc] init];
//        label.text = @"header";
//        [label sizeToFit];
//        [cView addSubview:label];
//        label.center = cView.center;
        return cView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //设置 title 区域高度
    if (section == 0) {
        return 20;
    }
    return 100.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([cell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([cell class])];
    }
    cell.backgroundColor = FYRandomColor;
    
    if (indexPath.section == 1) {
        cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MZHorizontalScrollTableViewCell class])];
        if (!cell) {
            cell = [[MZHorizontalScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([MZHorizontalScrollTableViewCell class])];
        }
        self.contentCell = (MZHorizontalScrollTableViewCell *)cell;
        [(MZHorizontalScrollTableViewCell *)cell updateUI];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 600;
    }
    return 40;
}
#pragma mark - setter
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self reloadData];
}

#pragma mark 嵌套滚动处理
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES; 
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"outer  %f",scrollView.contentOffset.y);
//    这里的 1 是嵌套tableView的位置   64=44+20  猜测这里的tableView是顶到头的
    CGFloat bottomCellOffset = [self rectForSection:1].origin.y - 64;
    if (scrollView.contentOffset.y >= bottomCellOffset) {
//        上滑 划不动  停留在bottomCellOffset位置
        scrollView.contentOffset = CGPointMake(0, bottomCellOffset); // 控制外层的tableView偏移量
        if (self.canScroll) {
            self.canScroll = NO;
            self.contentCell.cellCanScroll = YES;
        }
    }else{
//        下滑时 在不允许滑动时控制到 指定位置
        if (!self.canScroll) {//子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        }
    }
    self.showsVerticalScrollIndicator = _canScroll?YES:NO;
}

- (void)changeScrollStatus//改变主视图的状态
{
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}
@end
