//
//  HDFunctionViewController.m
//  TestFunction
//
//  Created by Cage  on 2019/10/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDFunctionViewController.h"
#import "Person.h"
#import "BBXMarginSliderView.h"


//字符串是否为空
#define IsStrEmpty(_ref)(( [(_ref) isKindOfClass:[NSNull class]]||(_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]) || ([(_ref) isEqualToString:@""]) )

@interface HDFunctionViewController ()
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) NSArray *testArray;
@property (nonatomic, strong) NSMutableArray *testArrayM;
@property (nonatomic, strong) Person *p1;
@end

@implementation HDFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self testFunction3];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
//    [self.view addGestureRecognizer:tap];
}
-(void)testFuction{
//    NSMutableDictionary *dictM = [[NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],[NSNull null],nil] mutableCopy];
//    [dictM setObject:@"new" forKey:[NSNull null]];
//     NSLog(@"dict ---- %@",dictM);
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
    [self.view addSubview:testLabel];
    testLabel.backgroundColor = [UIColor lightGrayColor];
    testLabel.numberOfLines = 0;
    NSString *testString = @"1.最小提现数量：100USDT\r\n2.请直接提现到个人钱包地址，切记不要提现到ICO的众筹地址、智能合约地址，否则将导致资产不可找回\r\n3.提现审核时间为每日10点-18点（新加坡时间），其他时间的提现请求将顺延到下一个自然日处理，请做好资金规划\r\n";
    testLabel.text = testString;
}
-(void)testFuction2{
    Person *view1 = [Person new];
    self.p1 = view1;
    self.p1.name = @"1";
    Person *view2 = [Person new];
    self.testArray = @[view1,view2];
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:view1,view2, nil];
    self.testArrayM = mArray;
    NSLog(@"%@",self.testArray);
    NSLog(@"%@",mArray);
}

-(void)tapAction{
//    源数据发生变化  数组数据是否跟随变化
    self.p1.name = @"2";
    NSLog(@"%@",self.testArray);
    NSLog(@"%@",self.testArrayM);
    NSLog(@"%@",self.p1.name);
    NSLog(@"%@",[(Person *)self.testArrayM.firstObject name]);
}
// 测试等宽字体和千分位符
-(void)testFunction3{
//    NSString *testString = @"请直接提现到个人钱包地址,1234567890";
//    NSLog(@"%@",[self OriginalStringToNumberFormatter:testString]);
    
//    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
//    [self.view addSubview:testLabel];
//    testLabel.backgroundColor = [UIColor lightGrayColor];
//    testLabel.numberOfLines = 0;
//    testLabel.text = [self OriginalStringToNumberFormatter:testString];
    
    UILabel *testLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 50)];
    testLabel2.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:testLabel2];
    testLabel2.backgroundColor = [UIColor lightGrayColor];
    testLabel2.numberOfLines = 0;
    testLabel2.text = @"+0.12993295";
    
    UILabel *testLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 300, 50)];
    testLabel3.font = [UIFont fontWithName:@"SFMono-Regular" size:16];
    
    [self.view addSubview:testLabel3];
    testLabel3.backgroundColor = [UIColor lightGrayColor];
    testLabel3.numberOfLines = 0;
//    testLabel3.text = [self NumberFormatterToOriginalString:@"33,369,080"] ;
    testLabel3.text = @"+0.12993295";
    
//    NSArray *familyNames = [UIFont fontNamesForFamilyName:@"SFMono"];
//    NSLog(@"%@",familyNames);
    [self getFontNames];
}
- (void)getFontNames
{
    NSArray *familyNames = [UIFont familyNames];
    
    for (NSString *familyName in familyNames) {
        printf("familyNames = %s\n",[familyName UTF8String]);
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        
        for (NSString *fontName in fontNames) {
            printf("\tfontName = %s\n",[fontName UTF8String]);
        }
    }
}
//转化为千分位格式,例如 :33369080 输出：33,369,080
-(NSString*)OriginalStringToNumberFormatter:(NSString*)str{
   NSString *numString = [NSString stringWithFormat:@"%@",str];
    
   NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
   NSNumber *number = [formatter numberFromString:numString];
   formatter.numberStyle=kCFNumberFormatterDecimalStyle;
   NSString *string = [formatter stringFromNumber:number];
   NSLog(@"numberFormatter == %@",string);
   if(IsStrEmpty(string)) {
   return str;
   }
   return string;
}
-(NSString*)NumberFormatterToOriginalString:(NSString*)str{
   NSString *numString = [NSString stringWithFormat:@"%@",str];
   NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle=kCFNumberFormatterDecimalStyle;
   NSNumber *number = [formatter numberFromString:numString];
   formatter.numberStyle=kCFNumberFormatterNoStyle;
   NSString *string = [formatter stringFromNumber:number];
   if(IsStrEmpty(string)) {
   return str;
   }
   return string;
}

- (void)testFunction4{
    CGPoint point1 = CGPointMake(50, 400);
    CGPoint point2 = CGPointMake(250, 400);
    CGPoint point3 = CGPointMake(150, 250);
    UIBezierPath *BPath = [UIBezierPath bezierPath];
    [BPath moveToPoint:point1];
    [BPath addLineToPoint:point2];
    [BPath addLineToPoint:point3];
    [BPath addLineToPoint:point1];
    CAShapeLayer *l = [CAShapeLayer layer];
    l.contentsScale = UIScreen.mainScreen.scale;
    l.path = BPath.CGPath;
    
    l.fillColor =[UIColor redColor].CGColor;
    [self.view.layer addSublayer:l];
}
//测试数组移动  倒叙遍历移动数组
- (void)testFunction5{
    NSArray *farray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:farray];
    NSLog(@"%@",mArray);
    NSMutableArray *reverseMArray = (NSMutableArray *)[[mArray reverseObjectEnumerator] allObjects];
    NSLog(@"%@",reverseMArray);
    [reverseMArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:@"7"]) {
            [mArray removeObject:obj];
            [mArray insertObject:obj atIndex:0];
        }
        if ([obj isEqualToString:@"8"]) {
            [mArray removeObject:obj];
            [mArray insertObject:obj atIndex:0];
        }
    }];
//    [mArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isEqualToString:@"7"]) {
//            [mArray replaceObjectAtIndex:0 withObject:obj];
//            [mArray removeObject:obj];
//            [mArray insertObject:obj atIndex:0];
//        }
//    }];
    NSLog(@"%@",mArray);
}
- (void)testFunction6{
    BBXMarginSliderView *sliderView = [BBXMarginSliderView new];
    [self.view addSubview:sliderView];
    sliderView.frame = CGRectMake(10, 100, 400, 50);
    sliderView.backgroundColor = [UIColor grayColor];
}

//{TCSwapDataCenter *center = [TCSwapDataCenter defaultCenter];
//    NSDictionary *tmpdic = nil;
//    NSArray *tmparr = nil;
//    NSMutableArray *dataList = [NSMutableArray array];
//    __block NSInteger index = 5;
//    NSEnumerationOptions enop = NSEnumerationConcurrent;
//    if (sortType == BBXHomeSortType_24h) {
//        tmpdic = [center market_allMarketDataWithSortType:TC_MarketSortType_Amount24];
//    }else {
//        tmpdic = [center market_allMarketDataWithSortType:TC_MarketSortType_Rate];
//    }
//    if (sortType == BBXHomeSortType_up) {
//        enop = NSEnumerationReverse;
//    }
//    if (rollType == BBXHomeRollType_spot_usdt) {
//        tmparr = tmpdic[@"spot"][@"spot_usdt"];
//        [tmparr enumerateObjectsWithOptions:enop usingBlock:^(TCSpotInfoModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
//            index--;
//            if (index == 0) *stop = YES;
//            BBXHomeViewModel *m = [[BBXHomeViewModel alloc] init];
//            m.name = model.stock.showName_view;
//            m.quote_coin = @"现货";
//            m.price = model.ticker.last_price;
//            if (sortType == BBXHomeSortType_24h) {
//                m.amount = model.ticker.amount24;
//            }else {
//                m.rate = model.ticker.rise_fall_rate;
//            }
//            [dataList addObject:m];
//        }];
//
//    }else {
//        if (rollType == BBXHomeRollType_swap_usdt) {
//            tmparr = tmpdic[@"swap"][@"swap_usdt"];
//        }else if (rollType == BBXHomeRollType_swap_coin) {
//            tmparr = tmpdic[@"swap"][@"swap_coin"];
//        }
//        [tmparr enumerateObjectsWithOptions:enop usingBlock:^(TCSwapInfoModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
//            index--;
//            if (index == 0) *stop = YES;
//            BBXHomeViewModel *m = [[BBXHomeViewModel alloc] init];
//            m.name = model.contract.showName_view;
//            m.quote_coin = model.contract.margin_coin_view;
//            m.price = model.ticker.last_price;
//            if (sortType == BBXHomeSortType_24h) {
//                m.amount = model.ticker.amount24;
//            }else {
//                m.rate = model.ticker.rise_fall_rate;
//            }
//            [dataList addObject:m];
//        }];
//    }}
@end
