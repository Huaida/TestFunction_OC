//
//  UIView+drawCornerRadius.m
//  TestFunction
//
//  Created by Cage on 2021/9/9.
//  Copyright © 2021 white. All rights reserved.
//

#import "UIView+drawCornerRadius.h"

@implementation UIView (drawCornerRadius)
- (UIImage *)lm_drawRectWithRoundedCorner:(CGFloat)radius
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
                          backGroundColor:(UIColor*)bgColor{
    CGSize size = self.bounds.size;
    CGRect rect = self.bounds;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef contextRef =  UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(contextRef, borderWidth);
    CGContextSetStrokeColorWithColor(contextRef, borderColor.CGColor);
    CGContextSetFillColorWithColor(contextRef, bgColor.CGColor);
    
    CGFloat halfBorderWidth = borderWidth / 2.0;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    CGContextMoveToPoint(contextRef, width - halfBorderWidth, radius + halfBorderWidth);
    CGContextAddArcToPoint(contextRef, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(contextRef, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
    CGContextAddArcToPoint(contextRef, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(contextRef, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius); // 右上角
    
    [self drawRect:rect];
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
