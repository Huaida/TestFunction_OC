//
//  HDTestView.m
//  TestFunction
//
//  Created by DanielHuai on 2022/3/2.
//  Copyright © 2022 white. All rights reserved.
//

#import "HDTestView.h"

@implementation HDTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
