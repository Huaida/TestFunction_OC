//
//  MZFullScreenViewModel.m
//  MengZhu
//
//  Created by 怀达 on 2019/7/22.
//  Copyright © 2019 www.mengzhu.com. All rights reserved.
//

#import "MZFullScreenViewModel.h"

@implementation MZFullScreenViewModel
+ (instancetype)fullScreenViewModelWithSelectorString:(NSString *)string weight:(NSInteger)weight;{
    MZFullScreenViewModel *model = [MZFullScreenViewModel new];
    model.selectorNameString = string;
    model.weight = weight;
    return model;
}
@end
