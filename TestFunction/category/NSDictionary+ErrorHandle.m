//
//  NSDictionary+ErrorHandle.m
//  MengZhu
//
//  Created by 怀达 on 2019/6/17.
//  Copyright © 2019 www.mengzhu.com. All rights reserved.
//

#import "NSDictionary+ErrorHandle.h"
#import <objc/runtime.h>
#import "NSObject+SwizzleMethod.h"

@implementation NSDictionary (ErrorHandle)
+(void)load{
    [super load];
    //无论怎样 都要保证方法只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //交换NSArray中的objectAtIndex方法
        [[self class] SystemSelector:@selector(initWithObjects:forKeys:count:) swizzledSelector:@selector(st_initWithObjects:forKeys:count:) error:nil];
       
    });
}

-(instancetype)st_initWithObjects:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        // 这里只做value 为nil的处理 对key为nil不做处理
        if (objects[i] == nil) {
            objects[i] = @"字典value为nil，请检查"  ;
        }
        if (keys[i] == nil) {
            keys[i] = @"字典key为nil，请检查";
        }
        
        rightCount++;
    }
    
    return  [self st_initWithObjects:objects forKeys:keys count:rightCount];
}


@end
