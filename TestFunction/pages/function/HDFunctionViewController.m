//
//  HDFunctionViewController.m
//  TestFunction
//
//  Created by Cage  on 2019/10/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDFunctionViewController.h"

@interface HDFunctionViewController ()

@end

@implementation HDFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self testFuction];
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



@end
