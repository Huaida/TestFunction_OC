//
//  NSMutableArray+SafeForData.m
//  TestFunction
//
//  Created by 怀达 on 2019/5/29.
//  Copyright © 2019 white. All rights reserved.
//

#import "NSMutableArray+SafeForData.h"
#import <objc/runtime.h>

@implementation NSMutableArray (SafeForData)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method sourceMethod1 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
        Method destMethod1 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeObjectAtIndex:));
        
        method_exchangeImplementations(sourceMethod1, destMethod1);
        
        Method sourceMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(removeObjectAtIndex:));
        Method destMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeRemoveObjectAtIndex:));
        
        method_exchangeImplementations(sourceMethod2, destMethod2);
        
        Method sourceMethod3 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(insertObject:atIndex:));
        Method destMethod3 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeInsertObject:atIndex:));
        
        method_exchangeImplementations(sourceMethod3, destMethod3);
        
        Method sourceMethod4 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(replaceObjectAtIndex:withObject:));
        Method destMethod4 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeReplaceObjectAtIndex:withObject:));
        
        method_exchangeImplementations(sourceMethod4, destMethod4);
    });
}
#pragma mark - 数组的安全处理
-(instancetype)safeObjectAtIndex:(NSInteger)index
{
    if (self.count < (index + 1)) {
        NSLog(@"Runtime Warning:index %li out of bound",index);
        return nil;
    }
    
    return [self safeObjectAtIndex:index];
}
-(void)safeRemoveObjectAtIndex:(NSInteger)index
{
    if (self.count <= index) {
        NSLog(@"Runtime Warning:index %li out of bound",index);
        return;
    }
    
    [self safeRemoveObjectAtIndex:index];
}
-(void)safeInsertObject:(id)object atIndex:(NSInteger)index
{
    if (!object) {
        NSLog(@"Runtime Warning:insert object can not be nil");
        return;
    }
    
    if (self.count < index) {
        NSLog(@"Runtime Warning:insert object at index %li out of bound",index);
        return;
    }
    
    [self safeInsertObject:object atIndex:index];
}
-(void)safeReplaceObjectAtIndex:(NSInteger)index withObject:(id)object
{
    if (index >= self.count) {
        NSLog(@"Runtime Warning:index %li out of bound",index);
        return;
    }
    
    if (!object) {
        NSLog(@"Runtime Warning:object can not be empty");
        return;
    }
    
    [self safeReplaceObjectAtIndex:index withObject:object];
}
@end
