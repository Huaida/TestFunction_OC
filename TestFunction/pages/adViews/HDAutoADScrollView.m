//
//  HDAutoADScrollView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADScrollView.h"
#import "HDAutoADCollectionView.h"
#import "HDPageControl.h"
@interface HDAutoADScrollView()<HDAutoADCollectionViewProtocal>
@property (nonatomic ,strong) HDAutoADCollectionView *collectionView;
@property (nonatomic ,strong) HDPageControl *pageControl;
@property (nonatomic ,strong) NSTimer *timer;
//@property (nonatomic ,strong) UIView *bgView;

@end
@implementation HDAutoADScrollView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self setBaseProperty];
    }
    return self;
}
- (void)setBaseProperty{
    [self customAddCollectionView];
//    [self customAddBgView];
    [self customAddPageControl];
}
//- (void)customAddBgView{
//    self.bgView = [[UIView alloc] init];
//    self.bgView.backgroundColor = MakeColorRGBA(0x000000, 0.3);
//    self.bgView.layer.cornerRadius = 2;
//    self.bgView.layer.masksToBounds = YES;
//    [self addSubview:self.bgView];
//}
- (void)customAddPageControl{
    self.pageControl = [[HDPageControl alloc] init];
    self.pageControl.backgroundColor = MakeColorRGBA(0x000000, 0.3);
    self.pageControl.layer.cornerRadius = 2;
    self.pageControl.layer.masksToBounds = YES;
    [self addSubview:self.pageControl];
}
- (void)customAddCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(MZ_SW, 80);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[HDAutoADCollectionView alloc]initWithFrame:CGRectMake(0,0,MZ_SW,80) collectionViewLayout:flowLayout];
    self.collectionView.pageDelegate = self;
    self.collectionView.backgroundColor = [UIColor redColor];

    [self addSubview:self.collectionView];
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self updateSubviewsWithData:dataArray];
    [self addTimerForScroll];
    
}
- (void)updateSubviewsWithData:(NSArray *)dataArray{
//    self.bgView.frame = CGRectMake(0, 0, dataArray.count * 10 +6, 10);
//    self.bgView.center = self.pageControl.center;
    self.collectionView.dataArray = [dataArray mutableCopy];
    CGFloat widthValue = dataArray.count * 10 + 6;
    CGFloat xValue = (MZ_SW - widthValue)/2.0;
    self.pageControl.frame = CGRectMake(xValue, 64, widthValue, 10);
    self.pageControl.numberOfPages = dataArray.count;
    self.pageControl.currentPage = 0;
}
- (void)addTimerForScroll{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollToNextItem) userInfo:nil repeats:YES];
    
}
- (void)scrollToNextItem{
   NSInteger currentRow = self.collectionView.indexPathsForVisibleItems.firstObject.row;
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:currentRow+1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:toIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
#pragma mark - collectionViewDelegate
- (void)AutoADCollectionViewcurrentDisplayPageNumber:(NSInteger)pageNumber{
    self.pageControl.currentPage = pageNumber;
}
-(void)AutoADCollectionViewSelectedLink:(NSString *)link{
     NSLog(@"%@",link);
}
- (void)AutoADCollectionViewPauseTimerForDragging{
    NSLog(@"%s",__func__);
    [self.timer setFireDate:[NSDate distantFuture]];
}
- (void)AutoADCollectionViewStartTimerForEndDragging{
    NSLog(@"%s",__func__);
    [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3]];
}
@end
