//
//  HDTestView.m
//  TestFunction
//
//  Created by Cage on 2021/9/7.
//  Copyright © 2021 white. All rights reserved.
//

#import "HDTestView.h"

@implementation HDTestView

- (void)drawRect:(CGRect)rect{
    // Drawing code.
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    //设置线条粗细宽度
    CGContextSetLineWidth(context, 1.0);
    //设置颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    //开始一个起始路径
    CGContextBeginPath(context);
    //起始点设置为(0,0):注意这是上下文对应区域中的相对坐标，
    CGContextMoveToPoint(context, 0, 0);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 100, 100);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 0, 150);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 50, 180);
    //设置下一个坐标点
    CGContextAddLineToPoint(context, 500, 180);
    //连接上面定义的坐标点
    CGContextStrokePath(context);
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [UILabel new];
        [self addSubview:label];
        label.frame = CGRectMake(0, 0, 300, 30);
        label.text = @"target：TestFunction_copy";
        label.textColor = UIColor.greenColor;
        label.font = [UIFont systemFontOfSize:20];
    }
    return self;
}
@end
