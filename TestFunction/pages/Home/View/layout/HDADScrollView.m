//
//  HDADScrollView.m
//  huaida
//
//  Created by 怀达 on 2019/7/12.
//  Copyright © 2019 www.huaida.com. All rights reserved.
//

#import "HDADScrollView.h"
#import "HDImageView.h"
@interface HDADScrollView()<UIScrollViewDelegate>
@property (nonatomic ,strong) NSMutableArray *imageArray;
@end
@implementation HDADScrollView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return self;
}
- (void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self customAddSubviewsWithDataArray:_dataArray];
}
- (void)customAddSubviewsWithDataArray:(NSMutableArray *)dataArray{
    self.contentSize = CGSizeMake(MZ_SW*dataArray.count, MZTotalScreenHeight);
    
    for (int i = 0; i < dataArray.count; i ++) {
        HDImageView *adView = [[HDImageView alloc] initWithFrame:CGRectMake(i * MZ_SW, 0, MZ_SW, MZTotalScreenHeight) :[UIImage imageNamed:@"bgImage"]];
        [self addSubview:adView];
        [self.imageArray addObject:adView];
//        [adView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dataArray[i]]] placeholderImage:[UIImage imageNamed:@"bgImage"]];
        [adView setImage:[UIImage imageNamed:dataArray[i]]];
        [adView customLayoutSubviews];
    }
    
    
}
- (NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray new];
    }
    return _imageArray;
}
#pragma mark - delegate
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        
        [self scrollToTargetOffsetWithPages:[self calculatePagesWithContentOffset:scrollView.contentOffset.x]];
    });
}
// 该方法会很柔和的滚动到指定位置
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//     NSLog(@"%@",@"===============");
////     NSLog(@"%@",scrollView);
//     NSLog(@"%@",NSStringFromCGPoint(velocity));
//     NSLog(@"%@",NSStringFromCGPoint(*targetContentOffset));
//    CGPoint target = *targetContentOffset;
////    如果target和当前距离较远，靠近当前页一页距离
//    CGFloat space =  fabs(target.x - scrollView.contentOffset.x);
//    if (space > HD_SW/2) {
//        if (target.x>scrollView.contentOffset.x) {
//
//            target = CGPointMake(target.x-HD_SW/2, 0);
//        }else{
//            target = CGPointMake(target.x+HD_SW/2, 0);
//        }
//    }
//    target = CGPointMake([self calculatePagesWithContentOffset:target.x], 0) ;
//
//    *targetContentOffset = target;
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
     [self.scrollDelegate ADScrollViewCurrentPages:[self calculatePagesWithContentOffset:scrollView.contentOffset.x]];
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//     拖拽不需要减速的情况
    if (!decelerate) {
//        手指控制滑动到指定位置后，停止滑动后拿开手指
        [self scrollToTargetOffsetWithPages:[self calculatePagesWithContentOffset:scrollView.contentOffset.x]];
        
    }

}
- (NSInteger)calculatePagesWithContentOffset:(CGFloat)offset{
    NSInteger pages = 0;
    pages = (offset+MZ_SW/2.0)/MZ_SW;
    
    return pages;
}
- (void)scrollToTargetOffsetWithPages:(NSInteger)pages{
    
    CGPoint contentOffset = CGPointMake(pages * MZ_SW, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self setContentOffset:contentOffset animated:YES];
    });
    
}
@end
