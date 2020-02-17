//
//  HDSignalViewController.m
//  TestFunction
//
//  Created by Cage  on 2020/2/17.
//  Copyright © 2020 white. All rights reserved.
//
//  测试信号量 等待 阻塞线程 释放

#import "HDSignalViewController.h"
#import "BTEvent.h"

@interface HDSignalViewController ()
@property (nonatomic ,strong) BTEvent *event;
@property (nonatomic,assign) int count;
@property (nonatomic ,strong) UILabel *countLabel;
@end

@implementation HDSignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.event = [BTEvent createEvent];
 
    [self customAddSubviews];
}
- (void)customAddSubviews{
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
    [self.view addSubview:btn1];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(waitForSignal) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 100, 50)];
    [self.view addSubview:btn2];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(sendSignal) forControlEvents:UIControlEventTouchUpInside];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 100, 50)];
    [self.view addSubview:self.countLabel];
    self.countLabel.text = [NSString stringWithFormat:@"self.count: %d",self.count];
    
}
-(void)waitForSignal{
    
     NSLog(@"%s",__func__);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        所有的任务都是放到线程中去执行的 阻塞线程后线程被挂起 等待信号重新激活
        while (self.count < 3) {
            [self.event wait];
        }
        if (self.count < 2) {
            NSLog(@"%@阻塞1",[NSThread currentThread]);
            [self.event wait];
            NSLog(@"%@阻塞2",[NSThread currentThread]);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.countLabel.text = [NSString stringWithFormat:@"self.count: %d",self.count];
            });
        }
        NSLog(@"count：  %d",self.count);
        
    });
}
-(void)sendSignal{
    NSLog(@"%s",__func__);
    self.count ++;
    
    [self.event signal];
    
    
}
- (void)setCount:(int)count{
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"self.count: %d",self.count];
}
@end
