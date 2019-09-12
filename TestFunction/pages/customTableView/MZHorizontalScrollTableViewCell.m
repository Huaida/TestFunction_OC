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
@interface MZHorizontalScrollTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic ,strong) UICollectionView *collectionView;
@end

@implementation MZHorizontalScrollTableViewCell

- (void)updateUI;{
    self.backgroundColor = [UIColor cyanColor];
    [self customAddSubviews];
}
- (void)customAddSubviews{
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
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@1,@2,@3,@1,@2,@3,@1,@2,@3,@1,@2,@3,];
    }
    return _dataArray;
}
#pragma mark - datasource & delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%s",__func__);
//    //    保持展示的内容在中间一组数据上  先
//    //    NSLog(@"willDisplayCell %ld",(long)indexPath.row);
//}
//- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%s",__func__);
//    //    消失后回调˚
//    //    NSLog(@"didEndDisplayingCell %ld",(long)indexPath.row);
//    UICollectionViewCell *currentCell = self.visibleCells.firstObject;
//    //    NSLog(@"currentCell: %@",currentCell);
//    ////     NSLog(@"currentCell %@",[self indexPathForCell:currentCell]);
//    NSInteger disappearCellRow = indexPath.row;
//    NSInteger currentCellRow = [self indexPathForCell:currentCell].row;
//    //    NSLog(@"currentCellRow: %ld",(long)currentCellRow);
//    ////    3-->2 变为 2->5  往回倒
//    if (disappearCellRow == 1 *self.numberOfContents && currentCellRow == 1*self.numberOfContents-1) {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:((times - 1)*self.numberOfContents-1) inSection:0];
//        NSLog(@"back 要从 %ld变化到 %ld位置",currentCellRow,(long)indexPath.row);
//        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//    }
//    //    往前走
//    if (disappearCellRow == ((times - 1) * self.numberOfContents-1) && currentCellRow == (times - 1)*self.numberOfContents) {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.numberOfContents inSection:0];
//
//        NSLog(@"forward 要从 %ld变化到 %ld位置",currentCellRow,(long)indexPath.row);
//        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//    }
//    if (currentCell) {
//
//        if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewcurrentDisplayPageNumber:)]) {
//            NSLog(@"当前page：  %ld",(long)(currentCellRow%self.numberOfContents));
//            [self.pageDelegate AutoADCollectionViewcurrentDisplayPageNumber:(currentCellRow%self.numberOfContents)];
//        }
//    }
//}
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSInteger dataIndex = indexPath.row%self.numberOfContents;
//    HDAutoADModel *model = self.dataArray[dataIndex];
//    if ([model isMemberOfClass:[HDAutoADModel class]]) {
//
//        if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewSelectedLink:)]) {
//            [self.pageDelegate AutoADCollectionViewSelectedLink:model.link];
//        }
//
//    }
//}
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%s",__func__);
//}
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"%s",__func__);
//    //    timer停止
//    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewPauseTimerForDragging)]) {
//        [self.pageDelegate AutoADCollectionViewPauseTimerForDragging];
//    }
//}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    NSLog(@"%s",__func__);
//}
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"%s",__func__);
//    //    timer开启
//    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(AutoADCollectionViewStartTimerForEndDragging)]) {
//        [self.pageDelegate AutoADCollectionViewStartTimerForEndDragging];
//    }
//}

@end
