//
//  UIImage+drawCircle.h
//  TestFunction
//
//  Created by Cage on 2021/9/9.
//  Copyright © 2021 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (drawCircle)

- (UIImage *)hd_drawRectWithRoundedCorner:(CGFloat)radius;
- (UIImage *)hd_drawRectWithRoundedCorner:(CGFloat)radius size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
