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
@interface MZCustomTableView()<UITableViewDelegate,UITableViewDataSource>

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
        
        [self registerClass:[MZHorizontalScrollTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MZHorizontalScrollTableViewCell class])];
    }
    return self;
}
//- (void)customHeaderFooterForSection{
//     NSLog(@"%ld",self.numberOfSections);
//   UITableViewHeaderFooterView *headerFooterView = [self headerViewForSection:0];
//     NSLog(@"%@",headerFooterView);
//    UIView *cView= [[UIView alloc ] initWithFrame:CGRectMake(0, 0, MZ_SW, 100)];
//    cView.backgroundColor = [UIColor yellowColor];
//    [headerFooterView.superview addSubview:cView];
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *cView= [[UIView alloc ] initWithFrame:CGRectMake(0, 0, MZ_SW, 100)];
        cView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"testImage3"]];
    return cView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //设置 title 区域高度
    return 100.f;
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return nil;
//}
#pragma mark - dataSource & delegate
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"test Header";
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    return @"test Footer";
//}
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
@end
