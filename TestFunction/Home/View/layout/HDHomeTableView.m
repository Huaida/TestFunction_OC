//
//  HDHomeTableView.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomeTableView.h"
#import "HDHomePresenter.h"
@interface HDHomeTableView ()<HDHomePresenterProtocol>
@property (nonatomic ,strong) HDHomePresenter *presenter;
@end
@implementation HDHomeTableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self  == [super initWithFrame:frame]) {
        
    }
    return self;
}
@end
