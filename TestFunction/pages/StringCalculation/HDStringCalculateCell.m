//
//  HDStringCalculateCell.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDStringCalculateCell.h"

@implementation HDStringCalculateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
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
    
        
}

// 测试发现线程之间的切换回带来卡顿，而全部放到主线程计算反而不会影响帧率，CPU和内存消耗都比主线程要多。而且会创建几十条线程。
- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    self.number = self.dataArray[1];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

        NSString *result = [[[self.number bbx_multiply:self.number] bbx_dividedBy:[[@"1" bbx_dividedBy:self.number] bbx_add:self.number] ] bbx_dividedBy:@"33"];
        NSLog(@"%@",result);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cellTitleLabel.text = [result bbx_standardNumberString];
        });
    });
    
    
//    NSString *result = [[[self.number bbx_multiply:self.number] bbx_dividedBy:[[@"1" bbx_dividedBy:self.number] bbx_add:self.number] ] bbx_dividedBy:@"33"];
//    NSLog(@"%@",result);
//    self.cellTitleLabel.text = [result bbx_standardNumberString];
    
    
}
@end
