//
//  HDScrollTextView.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/27.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDScrollTextView.h"
@interface HDScrollTextView()
@property (nonatomic ,strong) UIImageView *trumpetImageView;
@property (nonatomic ,strong) UILabel *tipLabel;
@property (nonatomic ,strong) UILabel *bulletinLabel;
@property (nonatomic ,strong) UIView *maskView;
@end
@implementation HDScrollTextView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self customAddSubviews];
        [self customLayoutSubviews];
    }
    return self;
}
- (void)customAddSubviews{
    
    _trumpetImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trumpetImage"]];
    [self addSubview:_trumpetImageView];
    
    _tipLabel = [[UILabel alloc] init];
    _tipLabel.text = @"公告 :";
    _tipLabel.textColor = MakeColorRGB(0xFF5B29);
    _tipLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_tipLabel];
    
    _bulletinLabel = [[UILabel alloc] init];
    _bulletinLabel.text = @"  ";
    _bulletinLabel.textColor = MakeColorRGB(0xFF5B29);
    _bulletinLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_bulletinLabel];
    
    _maskView = [[UIView alloc] init];
    _maskView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_maskView];
}

- (void)customLayoutSubviews{
    
    [_trumpetImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(12);
        make.width.height.mas_equalTo(20);
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.trumpetImageView.mas_right);
    }];
    [_bulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.tipLabel.mas_right).offset(3);
    }];
    [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.tipLabel.mas_right);
        make.right.top.bottom.equalTo(self);
    }];
}
- (void)setBulletinString:(NSString *)bulletinString{
    _bulletinString = bulletinString;
    _bulletinLabel.text = bulletinString;
    [_bulletinLabel sizeToFit];
    //    添加遮罩
    _bulletinLabel.maskView = _maskView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self startAnimation:_bulletinString.length*0.2];
    });
}
- (void)startAnimation:(NSTimeInterval)duration{
    
    [self setNeedsUpdateConstraints];
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.bulletinLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.tipLabel.mas_right);
            make.centerY.equalTo(self);
        }];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self loopAnimation];
    }];

}
- (void)loopAnimation{
    [self.bulletinLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_right);
        make.centerY.equalTo(self);
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startAnimation:(_bulletinString.length*0.1+1)*2];
    });
    
    
}
@end
