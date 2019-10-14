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
    
    self.view.backgroundColor = [UIColor redColor];
    [self testFuction];
}
-(void)testFuction{
    NSMutableDictionary *dictM = [[NSDictionary dictionaryWithObjectsAndKeys:[NSNull null],[NSNull null],nil] mutableCopy];
    [dictM setObject:@"new" forKey:[NSNull null]];
     NSLog(@"dict ---- %@",dictM);
}



@end
