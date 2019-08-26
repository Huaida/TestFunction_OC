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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HDAutoADCollectionViewCell class]) forIndexPath:indexPath];
     NSLog(@"cell------%@",cell);
    if (!cell) {
        cell = [[HDAutoADCollectionViewCell alloc] initWithFrame:self.bounds];
    }
    cell.backgroundColor = FYRandomColor;
    return cell;
}
- (void)setDataArray:(NSMutableArray *)dataArray{
    
    for (int i = 0; i < 100; i ++) {
        [_dataArray addObjectsFromArray:dataArray];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadData];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:dataArray.count * 50 inSection:0];
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
    });
}
@end
