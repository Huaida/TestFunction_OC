//
//  UINavigationBar+TestSpace.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/24.
//  Copyright © 2019 white. All rights reserved.
//

#import "UINavigationBar+TestSpace.h"
#import <objc/runtime.h>

@implementation UINavigationBar (TestSpace)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method originMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod(self, @selector(hd_layoutSubviews));
        method_exchangeImplementations(originMethod, swizzledMethod);
        
        
    });
}
- (void)hd_layoutSubviews{
    [self hd_layoutSubviews];
    
    
        CGFloat space = 0;
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsMake(0, space, 0, space);
                break;
            }
        }
    
}
@end
