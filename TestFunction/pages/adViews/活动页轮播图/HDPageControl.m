//
//  HDPageControl.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/27.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDPageControl.h"
@interface HDPageControl()
@property (nonatomic ,strong) NSMutableArray *dotsArray;
@property (nonatomic ,strong) UIView  *bigDot;
@end
@implementation HDPageControl


- (void)customAddSubviewsWithPages:(NSInteger)pages{
    self.dotsArray = [NSMutableArray new];
    
    self.bigDot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, 6)];
    self.bigDot.backgroundColor = [UIColor whiteColor];
    self.bigDot.layer.cornerRadius = 3;
    self.bigDot.layer.masksToBounds = YES;
    [self addSubview:self.bigDot];
    
    for (int i = 0; i < pages; i ++) {
        CGFloat xValue = 6+10*i;
        UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(xValue, 3, 4, 4)];
        dot.backgroundColor = [UIColor whiteColor];
        dot.alpha = 0.6;
        dot.layer.cornerRadius = 2;
        dot.layer.masksToBounds = YES;
        [self addSubview:dot];
        [self.dotsArray addObject:dot];
    }
    self.bigDot.center = [(UIView *)self.dotsArray.firstObject center];
}
#pragma mark - setter
-(void)setNumberOfPages:(NSInteger)numberOfPages{
    _numberOfPages = numberOfPages;
    [self customAddSubviewsWithPages:numberOfPages];
}
-(void)setCurrentPage:(NSInteger)currentPage{
    if (currentPage < 0) {
        return;
    }
    _currentPage = currentPage;
    if (currentPage < self.dotsArray.count) {
        self.bigDot.center = [(UIView *)self.dotsArray[currentPage] center];
    }
}


@end
