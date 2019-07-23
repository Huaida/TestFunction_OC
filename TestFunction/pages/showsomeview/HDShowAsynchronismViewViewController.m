//
//  HDShowAsynchronismViewViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/23.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDShowAsynchronismViewViewController.h"
#import "MZFullScreenViewModel.h"

@interface HDShowAsynchronismViewViewController ()
@property (nonatomic ,strong) NSMutableArray *fullscreenViewArray;//保持同时弹出的弹窗
@end

@implementation HDShowAsynchronismViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - 判断应该弹哪个弹窗
- (void)showNextFullScreenView{
    [self.fullscreenViewArray removeObjectAtIndex:0];
    if (self.fullscreenViewArray.count == 0) return;
    NSArray *sortArray = [self sortFullScreenViewArray];
    MZFullScreenViewModel *firstModel = sortArray[0];
    if ([self respondsToSelector:NSSelectorFromString(firstModel.selectorNameString)]) {
        firstModel.weight += Show_weight;
        [self performSelector:NSSelectorFromString(firstModel.selectorNameString)];
    }
}
- (void)judgeWhichViewWillShow:(NSInteger)weitht{
    //    已有内容排序
    NSArray *sortArray = [self sortFullScreenViewArray];
    // 如果第一个的权重和需要展示的view权重一致 展示
    MZFullScreenViewModel *firstModel = sortArray[0];
    if (firstModel.weight == weitht) {
        if ([self respondsToSelector:NSSelectorFromString(firstModel.selectorNameString)]) {
            firstModel.weight += Show_weight;
            [self performSelector:NSSelectorFromString(firstModel.selectorNameString)];
        }
    }
    
}
- (NSArray *)sortFullScreenViewArray{
    NSArray *sortArray = [self.fullscreenViewArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        MZFullScreenViewModel *model1 = obj1;
        MZFullScreenViewModel *model2 = obj2;
        if (model1.weight < model2.weight) return NSOrderedDescending;
        return NSOrderedAscending;
    }];
    
    
    NSLog(@"%@",sortArray);
    for (MZFullScreenViewModel *obj in self.fullscreenViewArray) {
        NSLog(@"%ld",obj.weight);
    }
    return sortArray;
}
-(void)judgeADImages{
    //            把广告加入数组
    [self.fullscreenViewArray addObject:[MZFullScreenViewModel fullScreenViewModelWithSelectorString:NSStringFromSelector(@selector(showADImages)) weight:Show_weight_AD]];
    [self judgeWhichViewWillShow:Show_weight_AD];
    
}
-(void)judgeSignInImages{
    
    [self.fullscreenViewArray addObject:[MZFullScreenViewModel fullScreenViewModelWithSelectorString:NSStringFromSelector(@selector(showForcedCheckInView)) weight:Show_weight_SignIn]];
    [self judgeWhichViewWillShow:Show_weight_SignIn];
}
-(void)judgeQRCodeImages{
    
    [self.fullscreenViewArray addObject:[MZFullScreenViewModel fullScreenViewModelWithSelectorString:NSStringFromSelector(@selector(showQRcodeView)) weight:Show_weight_QR]];
    [self judgeWhichViewWillShow:Show_weight_QR];
}
-(void)judgePrizeImages{
    //            把中奖加入数组
    [self.fullscreenViewArray addObject:[MZFullScreenViewModel fullScreenViewModelWithSelectorString:NSStringFromSelector(@selector(showPrizeView)) weight:Show_weight_Prize]];
    [self judgeWhichViewWillShow:Show_weight_Prize];
    
}



- (NSMutableArray *)fullscreenViewArray{
    if (!_fullscreenViewArray) {
        _fullscreenViewArray = [NSMutableArray new];
    }
    return _fullscreenViewArray;
}
@end
