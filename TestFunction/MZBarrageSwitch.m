//
//  MZBarrageSwitch.m
//  TestFunction
//
//  Created by 怀达 on 2019/5/27.
//  Copyright © 2019 white. All rights reserved.
//
#define MakeColorRGB(hex)  ([UIColor colorWithRed:((hex>>16)&0xff)/255.0 green:((hex>>8)&0xff)/255.0 blue:(hex&0xff)/255.0 alpha:1.0])

#import "MZBarrageSwitch.h"
@interface MZBarrageSwitch ()
@property (nonatomic, strong) UIImageView *circleImageView;
@end

@implementation MZBarrageSwitch

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.onTintColor = MakeColorRGB(0xFF5B29);
        //    找到imageview 放到上面一个label
        UIImageView *switchImageView  = nil;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 43, 37)];
        self.sLabel = label;
        label.text = @"弹幕";
        //    label.bounds = CGRectMake(-10, -9, 43, 43);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = MakeColorRGB(0x9B9B9B);
        
        label.font = [UIFont systemFontOfSize:10];
        for (UIView *sub in [self.subviews.lastObject subviews]) {

            if ([sub isMemberOfClass:[UIImageView class]]) {
                switchImageView = (UIImageView *)sub;
            }
        }
        switchImageView.bounds = CGRectMake(0, 0, 43, 43);
        [switchImageView addSubview:label];
        
        
        [self addTarget:self action:@selector(switchONorOFF:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}
- (void)switchONorOFF:(UISwitch *)sw{
    self.sLabel.textColor = sw.isOn ?MakeColorRGB(0xFF5B29): MakeColorRGB(0x9B9B9B);
    UIImageView *switchImageView  = nil;
    for (UIView *sub in [self.subviews.lastObject subviews]) {
        
        if ([sub isMemberOfClass:[UIImageView class]]) {
            switchImageView = (UIImageView *)sub;
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
        switchImageView.bounds = CGRectMake(0, 0, 43, 43);
    });
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
