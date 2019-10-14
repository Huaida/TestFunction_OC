//
//  NSObject+SwizzleMethod.m
//  数组越界
//
//  Created by mic on 2017/12/29.
//  Copyright © 2017年 JZ. All rights reserved.
//

#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>

@implementation NSObject (SwizzleMethod)

/**
 *  对系统方法进行替换
 *
 *  @param systemSelector 被替换的方法
 *  @param swizzledSelector 实际使用的方法
 *  @param error            替换过程中出现的错误消息
 *
 *  @return 是否替换成功
 */
+ (BOOL)SystemSelector:(SEL)systemSelector swizzledSelector:(SEL)swizzledSelector error:(NSError *)error{
    
    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    if (!systemMethod) {
        return [[self class] unrecognizedSelector:systemSelector error:error];
    }
    
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!swizzledMethod) {
        
        return [[self class] unrecognizedSelector:swizzledSelector error:error];
    }
    
    if (class_addMethod([self class], systemSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {

        class_replaceMethod([self class], swizzledSelector, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, swizzledMethod);
    }
    
    return YES;
}

+ (BOOL)unrecognizedSelector:(SEL)selector error:(NSError *)error{
    
    NSString *errorString = [NSString stringWithFormat:@"%@类没有找到%@", NSStringFromClass([self class]), NSStringFromSelector(selector)];
    
    error = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:-1 userInfo:@{NSLocalizedDescriptionKey:errorString}];
    
    return NO;
}
- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    NSLog(@"💣💣💣💣💣💣💣 %@ 的对象 当做数组处理 在取下标",[self class]);
    return nil;
}
@end
