//
//  HDAutoADCollectionViewCell.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDAutoADCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface HDAutoADCollectionViewCell()
@property (nonatomic ,strong) UILabel *label;
@end
@implementation HDAutoADCollectionViewCell



-(void)setModel:(HDAutoADModel *)model{
    _model = model;
    [self updateSubviewsWithModel:model];
}
- (void)updateSubviewsWithModel:(HDAutoADModel *)model{
    if (model.type == 0) {
//        文字
        self.contentView.backgroundColor = MakeColorRGB(model.style.backgroundColor.integerValue);
        UILabel *adLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:adLabel];
        adLabel.font = [UIFont systemFontOfSize:model.style.fontSize *MZ_RATE];
        adLabel.text = model.content;
        adLabel.textColor = MakeColorRGB([model.style.fontColor integerValue]);
        
    }else{
//        图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.content] placeholderImage:[UIImage imageNamed:@""] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
        }];
        
    }
}
- (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

@end
