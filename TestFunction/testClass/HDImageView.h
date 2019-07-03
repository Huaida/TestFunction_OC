//
//  HDImageView.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/3.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDImageView : UIView
@property (nonatomic ,strong) UIImage *image;
-(instancetype)initWithFrame:(CGRect)frame :(UIImage *)image;
-(instancetype)initWithImage:(UIImage *)image;
- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder ;
// 布局前，一定要有image 并且自身frame已确定  进一步，可以KVO imageView的image每次更新View，重新布局下
- (void)customLayoutSubviews;
@end
NS_ASSUME_NONNULL_END
