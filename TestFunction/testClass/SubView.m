//
//  SubView.m
//  TestFunction
//
//  Created by 怀达 on 2019/1/4.
//  Copyright © 2019年 white. All rights reserved.
//

#import "SubView.h"

@implementation SubView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s-- %@",__func__,self.name);
    // if subview'name is v4 return v4
//    for (UIView *sub in self.subviews) {
//        NSString *name = [sub valueForKey:@"name"];
//        if ([name isEqualToString:@"v4"]) {
//            return sub;
//        }
//    }
    return [super hitTest:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s-- %@",__func__,self.name);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
