//
//  BTEvent.m
//  BTStore
//
//  Created by Jason_Lee on 2018/2/3.
//  Copyright © 2018年 Karl. All rights reserved.
//

#import "BTEvent.h"
@interface BTEvent()
@property (nonatomic,strong) NSCondition * condition;
@property (nonatomic,assign) int count;
@end
@implementation BTEvent

+ (instancetype)createEvent
{
    BTEvent * event = [[BTEvent alloc]init];
    return event;
}

- (instancetype)init
{
    self = [super init];
    if (nil == self) {
        return self;
    }
    self.condition = [[NSCondition alloc]init];
    return self;
}
- (void)signal
{
    [_condition lock];
    ++_count;
    [_condition broadcast];//所有阻塞线程全部唤起
    [_condition unlock];
}

- (BOOL)wait
{
    if (_count >0) {
//        signal 之后 立即返回
        return YES;
    }
    [_condition lock];
    
    if ( _count <= 0 ) {
//        等待signal有值
        [_condition wait];
    }
    [_condition unlock];
    return YES;
}

- (BOOL)waitUntilDate:(NSDate *)limit
{
    if (_count >0) {
        return YES;
    }
    BOOL ok = YES;
    [_condition lock];
    if ( _count <= 0 ) {
        ok = [_condition waitUntilDate:limit];
    }
    [_condition unlock];
    return ok;
}
@end
