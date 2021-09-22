//
//  HDHomeTableViewCell.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomeTableViewCell.h"

@implementation HDHomeTableViewCell




-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configCell];
    }
    return self;
}

-(void)configCell{
    self.cellTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    self.cellTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.cellTitleLabel.text = self.dataArray[0];
    [self.contentView addSubview:self.cellTitleLabel];
//    self.cellTitleLabel.backgroundColor = UIColor.grayColor;
    
    self.classNameString = self.dataArray[1];
}
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    self.classNameString = self.dataArray[1];
    self.cellTitleLabel.text = self.dataArray[0];
}
@end
