//
//  HDAutoADCollectionView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADCollectionView.h"
#import "HDAutoADCollectionViewCell.h"
#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

@interface HDAutoADCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,assign) NSInteger numberOfContents;
@end
@implementation HDAutoADCollectionView
//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self == [super initWithFrame:frame]) {
//        [self setBaseProperty];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self == [super initWithFrame:frame collectionViewLayout:layout]) {
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
    
    [self registerClass:[HDAutoADCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HDAutoADCollectionViewCell class])];
    
}
#pragma mark - setter
- (void)setDataArray:(NSMutableArray *)dataArray{
    self.numberOfContents = dataArray.count;
    for (int i = 0; i < 3; i ++) {
        [_dataArray addObjectsFromArray:dataArray];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:dataArray.count * 1 inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
    });
}
#pragma mark - datasource & delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HDAutoADCollectionViewCell class]) forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[HDAutoADCollectionViewCell alloc] initWithFrame:self.bounds];
    }
    cell.backgroundColor = FYRandomColor;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    保持展示的内容在中间一组数据上  先
    NSLog(@"willDisplayCell %ld",(long)indexPath.row);
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    消失后回调˚
    NSLog(@"didEndDisplayingCell %ld",(long)indexPath.row);
    UICollectionViewCell *currentCell = self.visibleCells.firstObject;
     NSLog(@"currentCell %@",[self indexPathForCell:currentCell]);
    NSInteger disappearCellRow = indexPath.row;
    NSInteger currentCellRow = [self indexPathForCell:currentCell].row;
//    3-->2 变为 2->5
    if (disappearCellRow == self.numberOfContents && currentCellRow == self.numberOfContents-1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:(2*self.numberOfContents-1) inSection:0];
        NSLog(@"要滚动到的位置%ld",(long)indexPath.row);
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    if (disappearCellRow == (2*self.numberOfContents-1) && currentCellRow == 2*self.numberOfContents) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.numberOfContents inSection:0];
        NSLog(@"要滚动到的位置%ld",(long)indexPath.row);
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

@end
