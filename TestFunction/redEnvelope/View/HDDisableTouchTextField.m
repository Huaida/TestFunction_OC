//
//  HDDisableTouchTextField.m
//  huaida
//

//  Copyright © 2016年 www.huaida.com. All rights reserved.
//

#import "HDDisableTouchTextField.h"

@implementation HDDisableTouchTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if(action==@selector(cut:))// 禁止剪切
        return NO;
    if(action==@selector(copy:))// 禁止复制
         return NO;
    if(action==@selector(paste:))//禁止粘贴
        return NO;
    if(action==@selector(select:))// 禁止选择
        return NO;
    if(action==@selector(selectAll:))// 禁止全选
        return NO;
    return[super canPerformAction:action withSender:sender];
}

/*

 // Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
