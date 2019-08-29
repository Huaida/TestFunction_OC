//
//  HDAutoADCollectionView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADCollectionView.h"
#import "HDAutoADCollectionViewCell.h"
#import "HDAutoADModel.h"

#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define times 100

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
    
    for (int i = 0; i < times; i ++) {
        [_dataArray addObjectsFromArray:dataArray];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:dataArray.count * times/2 inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
    });
}
#pragma mark - datasource & delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HDAutoADCollectionViewCell * cell = [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HDAutoADCollectionViewCell class]) forIndexPath:indexPath];
    if (!cell) {
        cell = [[HDAutoADCollectionViewCell alloc] initWithFrame:self.bounds];
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
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
//    保持展示的内容在中间一组数据上  先
//    NSLog(@"willDisplayCell %ld",(long)indexPath.row);
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__func__);
//    消失后回调˚
//    NSLog(@"didEndDisplayingCell %ld",(long)indexPath.row);
    UICollectionViewCell *currentCell = self.visibleCells.firstObject;
//    NSLog(@"currentCell: %@",currentCell);
////     NSLog(@"currentCell %@",[self indexPathForCell:currentCell]);
    NSInteger disappearCellRow = indexPath.row;
    NSInteger currentCellRow = [self indexPathForCell:currentCell].row;
//    NSLog(@"currentCellRow: %ld",(long)currentCellRow);
////    3-->2 变为 2->5  往回倒
    if (disappearCellRow == 1 *self.numberOfContents && currentCellRow == 1*self.numberOfContents-1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:((times - 1)*self.numberOfContents-1) inSection:0];
        NSLog(@"back 要从 %ld变化到 %ld位置",currentCellRow,(long)indexPath.row);
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
//    往前走
    if (disappearCellRow == ((times - 1) * self.numberOfContents-1) && currentCellRow == (times - 1)*self.numberOfContents) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.numberOfContents inSection:0];

        NSLog(@"forward 要从 %ld变化到 %ld位置",currentCellRow,(long)indexPath.row);
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    if (currentCell) {

        if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewcurrentDisplayPageNumber:)]) {
            NSLog(@"当前page：  %ld",(long)(currentCellRow%self.numberOfContents));
            [self.pageDelegate AutoADCollectionViewcurrentDisplayPageNumber:(currentCellRow%self.numberOfContents)];
        }
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger dataIndex = indexPath.row%self.numberOfContents;
    HDAutoADModel *model = self.dataArray[dataIndex];
    if ([model isMemberOfClass:[HDAutoADModel class]]) {
        
    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewSelectedLink:)]) {
        [self.pageDelegate AutoADCollectionViewSelectedLink:model.link];
    }
    
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"%s",__func__);
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
//    timer停止
    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewPauseTimerForDragging)]) {
        [self.pageDelegate AutoADCollectionViewPauseTimerForDragging];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%s",__func__);
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%s",__func__);
//    timer开启
    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewStartTimerForEndDragging)]) {
        [self.pageDelegate AutoADCollectionViewStartTimerForEndDragging];
    }
}

@end
