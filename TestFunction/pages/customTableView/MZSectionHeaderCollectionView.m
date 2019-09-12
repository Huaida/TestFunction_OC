//
//  MZSectionHeaderCollectionView.m
//  TestFunction
//
//  Created by 怀达 on 2019/9/9.
//  Copyright © 2019 white. All rights reserved.
//

#import "MZSectionHeaderCollectionView.h"

#define FYColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define FYRandomColor FYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))


@interface MZSectionHeaderCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic ,strong) NSArray *data;
@end
@implementation MZSectionHeaderCollectionView

+ (instancetype)sectionHeaderFromData:(NSArray *)data{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(MZ_SW/4.0, 100);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    MZSectionHeaderCollectionView *headerView = [[MZSectionHeaderCollectionView alloc]initWithFrame:CGRectMake(0,0,MZ_SW/4.0,100) collectionViewLayout:flowLayout];
    headerView.showsVerticalScrollIndicator = NO;
    headerView.showsHorizontalScrollIndicator = NO;
    headerView.dataSource = headerView;
    headerView.delegate = headerView;
    headerView.pagingEnabled = NO;
    headerView.bounces = NO;
    [headerView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MZSectionHeaderCollectionViewcell"];
    headerView.data = data;
    
    
    return headerView;
}
#pragma mark - datasource & delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MZSectionHeaderCollectionViewcell" forIndexPath:indexPath];
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"indexPathindexPathindexPathindexPathindexPath %@",indexPath);
    [self.sectionHeaderDelegate sectionHeaderCollectionViewDidSelectedIndex:indexPath];
}
@end
