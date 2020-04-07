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
@property (nonatomic ,strong) BTEvent *event1;
@property (nonatomic ,strong) BTEvent *event2;
@property (nonatomic,assign) int count;
@property (nonatomic ,strong) UILabel *countLabel;
@property (nonatomic ,strong) NSLock  *lock;

@end

    
@implementation HDSignalViewController
{
    dispatch_semaphore_t semaphore;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.event1 = [BTEvent createEvent];
    self.event2 = [BTEvent createEvent];
    self.lock = [[NSLock alloc] init];
    [self customAddSubviews];
    self->semaphore = dispatch_semaphore_create(5);
}
- (void)customAddSubviews{
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 200, 50)];
    [self.view addSubview:btn1];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"waitForSignal" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(waitForSignal) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 300, 200, 50)];
    [self.view addSubview:btn2];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 setTitle:@"sendSignal" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(sendSignal) forControlEvents:UIControlEventTouchUpInside];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 100, 50)];
    [self.view addSubview:self.countLabel];
    self.countLabel.text = [NSString stringWithFormat:@"self.count: %d",self.count];
    
}
-(void)waitForSignal{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.apple.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
//        for (int i = 0 ; i < 100; i ++) {
            dispatch_async(concurrentQueue, ^{
                            NSLog(@"被阻塞线程%@",[NSThread currentThread]);
                dispatch_semaphore_wait(self->semaphore, DISPATCH_TIME_FOREVER);
                            NSLog(@"被阻塞线程%@  --阻塞结束",[NSThread currentThread]);
    
                 
    //            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                for (int j = 0; j < 10000000; j++) {
//                    if (j == 99999) {
//                        dispatch_semaphore_signal(semaphore);
//                    }
//                }
    
    //            });
            });
//        }
    
//     NSLog(@"%s",__func__);
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        所有的任务都是放到线程中去执行的 阻塞线程后线程被挂起 等待信号重新激活
//        while (self.count < 3) {
//            NSLog(@"被阻塞线程%@",[NSThread currentThread]);
////             等待信号量大于三改线程才会再次执行
////            [self.event1 wait];
//            [self.lock lock];
//            NSLog(@"被阻塞线程%@  --阻塞结束",[NSThread currentThread]);
//        }
////        if (self.count < 2) {
////            NSLog(@"%@阻塞1",[NSThread currentThread]);
////            [self.event wait];
////            NSLog(@"%@阻塞2",[NSThread currentThread]);
////            dispatch_async(dispatch_get_main_queue(), ^{
////
////                self.countLabel.text = [NSString stringWithFormat:@"self.count: %d",self.count];
////            });
////        }
//
//        NSLog(@"count：  %d",self.count);
//
//    });
}
-(void)sendSignal{
    dispatch_semaphore_signal(self->semaphore);
    NSLog(@"%s",__func__);
//    self.count ++;
//
////    [self.event2 signal];// 锁线程必须是同一个对象，否则开锁无效
//    [self.lock unlock];
    
    
}
- (void)setCount:(int)count{
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"self.count: %d",self.count];
}
@end
