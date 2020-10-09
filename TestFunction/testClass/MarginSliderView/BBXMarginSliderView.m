//
//  BBXMarginSliderView.m
//  BBX_Pro
//
//  Created by Cage on 2020/5/27.
//  Copyright © 2020 BBX_Daniel. All rights reserved.
//

#import "BBXMarginSliderView.h"


@interface BBXMarginSliderView()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UILabel *maxAddLabel;
@property (nonatomic, strong) UILabel *maxSubLabel;
@property (nonatomic, strong) UIView *zeroTipView;
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIView *moveView;
@property (nonatomic, assign) CGFloat totalValue;
@property (nonatomic, assign) CGFloat maxSubValue;
@property (nonatomic, assign) CGFloat maxAddValue;
@property (nonatomic, assign) BOOL keyForOnce;
@property (nonatomic, assign) CGAffineTransform orginalTransform;
@end
@implementation BBXMarginSliderView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customSetting];
    }
    return self;
}

-(void)customSetting{
    self.layer.masksToBounds = YES;
    
    UILabel *maxAddLabel = [UILabel new];
    self.maxAddLabel = maxAddLabel;
    [self addSubview:maxAddLabel];
    [maxAddLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    UILabel *maxSubLabel = [UILabel new];
    self.maxSubLabel = maxSubLabel;
    [self addSubview:maxSubLabel];
    [maxSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    UIView *mainView = [UIView new];
    self.mainView = mainView;
    mainView.backgroundColor = [UIColor whiteColor];
    [self addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.right.equalTo(self).offset(16);
        make.bottom.equalTo(self).offset(39);
        make.height.mas_equalTo(1);
    }];
    
    UIView *minTipView = [UIView new];
    minTipView.backgroundColor =  [UIColor whiteColor];
    [self addSubview:minTipView];
    [minTipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16);
        make.bottom.equalTo(mainView.mas_top);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(7);
    }];
    
    UIView *zeroTipView = [UIView new];
    self.zeroTipView = zeroTipView;
    zeroTipView.backgroundColor = [UIColor whiteColor];;
    [self addSubview:zeroTipView];
    
    
    
    UIView *maxTipView = [UIView new];
    maxTipView.backgroundColor = [UIColor whiteColor];;;
    [self addSubview:maxTipView];
    [maxTipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-(16));
        make.bottom.equalTo(mainView.mas_top);
        make.width.mas_equalTo((1));
        make.height.mas_equalTo((7));
    }];
    
    UIView *moveView = [UIView new];
    self.moveView = moveView;
    moveView.backgroundColor = [UIColor blueColor];;;
    moveView.layer.masksToBounds = YES;
    moveView.layer.cornerRadius =(16);
    [self addSubview:moveView];
    [moveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo((32));
        make.height.mas_equalTo((32));
        make.centerY.equalTo(self);
        make.centerX.mas_equalTo(20);
    }];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [moveView addGestureRecognizer:gesture];
    gesture.delegate = self;
}

// 根据手指位置调整布局
- (void)gestureAction:(UIPanGestureRecognizer *)pan{
//    CGPoint transP = [pan translationInView:self.moveView];
//    NSLog(@"%@",NSStringFromCGPoint(transP));
    
    CGPoint fingerPoint = [pan locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(fingerPoint));
    CGFloat centerY = self.moveView.center.y;
//    self.moveView.frame = CGRectMake(fingerPoint.x, oFrame.origin.y, oFrame.size.width, oFrame.size.height);
    self.moveView.center = CGPointMake(fingerPoint.x, centerY);
    NSLog(@"center %@",NSStringFromCGPoint(CGPointMake(fingerPoint.x, centerY)));
//    if (self.moveView.frame.origin.x < 0 ){
//        self.moveView.frame = CGRectMake(0, oFrame.origin.y, oFrame.size.width, oFrame.size.height);
//    }else if(CGRectGetMaxX(self.moveView.frame) > self.frame.size.width) {
//        CGRect oFrame = self.moveView.frame;
//        self.moveView.frame = CGRectMake(self.frame.size.width-oFrame.size.width, oFrame.origin.y, oFrame.size.width, oFrame.size.height);
//    }else{
////        self.moveView.transform = CGAffineTransformTranslate(self.moveView.transform, transP.x, 0);
////        self.moveView.transform = CGAffineTransformMakeTranslation(transP.x, 0);
//    }
//    [pan setTranslation:CGPointZero inView:self.moveView];

    
    
    
    
//    CGFloat rate = self.moveView.left/self.mainView.width;
//    CGFloat leftValue = self.totalValue * rate;
//    TCSwapInfoModel *swapInfo = [BBXGlobalTool sharedTool].selectedSwapInfoModel;
//    NSString *valueUnit = swapInfo.contract.value_unit;
//
//    if (leftValue < self.maxSubValue) {
//        //        减
//        CGFloat sub = self.maxSubValue - leftValue;
//        NSString *unit = [NSString stringWithFormat:@"-%%.%ldf",(long)[valueUnit BBXString_getUnit]];
//        [self.delegate BBXMarginSliderViewShowValue:[NSString stringWithFormat:unit,sub]];
//    }
//    if (leftValue == self.maxSubValue) {
//        //        0
//        [self.delegate BBXMarginSliderViewShowValue:@"0"];
//    }
//    if (leftValue > self.maxSubValue) {
//        //        加
//        CGFloat add = self.maxAddValue -( self.totalValue - leftValue);
//        NSString *unit = [NSString stringWithFormat:@"%%.%ldf",(long)[valueUnit BBXString_getUnit]];
//        [self.delegate BBXMarginSliderViewShowValue:[NSString stringWithFormat:unit,add]];
//    }
}


//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    UIView *view = gestureRecognizer.view;
//    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        CGPoint offset = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:view];
//
//        if (view.left == 0 && offset.x<0 ) {
//            NSLog(@"%@",@"禁止滑动1");
//            return NO;
//        }
//        if (view.right == self.width && offset.x>0 ) {
//            NSLog(@"%@",@"禁止滑动2");
//            return NO;
//        }
//        NSLog(@"%@",@"允许滑动1");
//        return YES;
//    }
//    NSLog(@"%@",@"允许滑动2");
//    return YES;
//}

@end
