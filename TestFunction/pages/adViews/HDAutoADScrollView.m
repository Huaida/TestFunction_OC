//
//  HDAutoADScrollView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADScrollView.h"
#import "HDAutoADCollectionView.h"
@interface HDAutoADScrollView()
@property (nonatomic ,strong) HDAutoADCollectionView *collectionView;
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
    [self customAddCollectionView];
    [self customAddPageControl];
}
- (void)customAddPageControl{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 80, MZ_SW, 20)];
    [self addSubview:self.pageControl];
}
- (void)customAddCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(MZ_SW, 100);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[HDAutoADCollectionView alloc]initWithFrame:CGRectMake(0,0,MZ_SW,100) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor redColor];

    [self addSubview:self.collectionView];
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self updateSubviewsWithData:dataArray];
    
    
}
- (void)updateSubviewsWithData:(NSArray *)dataArray{

    self.collectionView.dataArray = [dataArray mutableCopy];
    self.pageControl.numberOfPages = dataArray.count;
    self.pageControl.currentPage = 0;
}
@end
