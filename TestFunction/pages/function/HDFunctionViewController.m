//
//  HDFunctionViewController.m
//  TestFunction
//
//  Created by Cage  on 2019/10/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDFunctionViewController.h"
#import "Person.h"

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
    [self testFuction2];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addGestureRecognizer:tap];
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
@end
