//
//  HDHomeModel.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/1.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDHomeModel.h"
@interface HDHomeModel ()
@property (nonatomic ,weak) id<HDHomeModelProtocol> delegate;
@end
@implementation HDHomeModel
- (instancetype)initWithDelegate:(id<HDHomeModelProtocol>)delegate{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}
-(void)modelLoadData{
    
}
@end
