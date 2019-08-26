//
//  HDImageView.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/3.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDImageView.h"
#import "UIImageView+WebCache.h"
@interface HDImageView()
@property (nonatomic ,strong) UIImageView *innerImageView;
@end
@implementation HDImageView

-(instancetype)initWithFrame:(CGRect)frame :(UIImage *)image{
    if (self == [super initWithFrame:frame]) {
        self.image = image;
        [self customAddSubviews];
    }
    return self;
}
-(instancetype)initWithImage:(UIImage *)image;{
    if (self == [super init]) {
        self.image = image;
        [self customAddSubviews];
    }
    return self;
}
- (void)customAddSubviews{
    self.innerImageView = [[UIImageView alloc] init];
    self.innerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.innerImageView];
}
- (void)customLayoutSubviews{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //    根据图片的长宽比 设置内部imageView 的frame  图片左上角布局
        
        CGSize imageSize = self.image.size;
        CGSize containerSize = self.frame.size;
        
        CGFloat imageHeightWithScale = imageSize.height/imageSize.width;
        CGFloat innerImageViewWith;
        CGFloat innerImageViewHeight;
        //    图片比容器细长
        if (imageHeightWithScale > containerSize.height/containerSize.width) {
            //        保持宽度与容器一致
            innerImageViewWith = containerSize.width;
            innerImageViewHeight = innerImageViewWith * imageHeightWithScale;
        }else{
            //        保持高度与容器一致
            innerImageViewHeight = containerSize.height;
            innerImageViewWith = innerImageViewHeight/imageHeightWithScale;
        }
        self.innerImageView.frame =  CGRectMake(0, 0, innerImageViewWith, innerImageViewHeight);
    });
    
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder ;{
    [self.innerImageView sd_setImageWithURL:url placeholderImage:placeholder];
}
- (void)setImage:(UIImage *)image{
    _image = image;
    self.innerImageView.image = image;
}
@end
