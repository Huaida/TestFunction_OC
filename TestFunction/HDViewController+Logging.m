//
//  HDViewController+Logging.m
//  TestFunction
//
//  Created by 怀达 on 2019/4/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDViewController+Logging.h"
#import <objc/runtime.h>

static NSString *myname = @"";

@implementation HDViewController (Logging)


-(void)setCategoryName:(NSString *)name{
    myname = [name copy];
}
-(NSString *)categoryName{
    return myname;
}

//+ (void)load
//{
//    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
//}
//
//- (void)swizzled_viewDidAppear:(BOOL)animated
//{
//    // call original implementation
//    [self swizzled_viewDidAppear:animated];
//
//    // Logging
//    NSLog(@"%@", NSStringFromClass([self class]));
//}
//
//void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
//{
//    // the method might not exist in the class, but in its superclass
//    Method originalMethod = class_getInstanceMethod(class, originalSelector);
//    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//
//    // class_addMethod will fail if original method already exists
//    // 判断originalSelector是否已经指向了交换方法
//    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//
//    // the method doesn’t exist and we just added one
//    // 如果originalSelector指向成功，那么在重新切换swizzledSelector就可以了 否则两个方法交换下 避免重复交换
//    if (didAddMethod) {
//        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//    }
//    else {
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    }
//
//}
void test(){
//    class_getInstanceMethod(Class _Nullable cls, SEL _Nonnull name)
//
//    method_getImplementation(Method _Nonnull m)
//
//    class_addMethod(Class _Nullable cls, SEL _Nonnull name, IMP _Nonnull imp,
//                    const char * _Nullable types)
//
//    class_replaceMethod(Class _Nullable cls, SEL _Nonnull name, IMP _Nonnull imp,
//                        const char * _Nullable types)

}
@end
