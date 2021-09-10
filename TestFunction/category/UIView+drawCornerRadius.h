//
//  UIView+drawCornerRadius.h
//  TestFunction
//
//  Created by Cage on 2021/9/9.
//  Copyright © 2021 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (drawCornerRadius)
- (UIImage *)lm_drawRectWithRoundedCorner:(CGFloat)radius
                              borderWidth:(CGFloat)borderWidth
                              borderColor:(UIColor *)borderColor
                          backGroundColor:(UIColor*)bgColor;
@end

NS_ASSUME_NONNULL_END
