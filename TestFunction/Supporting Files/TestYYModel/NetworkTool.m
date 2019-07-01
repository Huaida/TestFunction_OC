//
//  NetworkTool.m
//  TestFunction
//
//  Created by 怀达 on 2019/4/22.
//  Copyright © 2019 white. All rights reserved.
//

#import "NetworkTool.h"
#import "AFNetworking.h"

@implementation NetworkTool
static NetworkTool *tool = nil;

+ (instancetype)shareNetworkTool;{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool == nil) {
            
            tool = [[self alloc] init];
        }
    });
    return tool;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool == nil) {
            tool = [super allocWithZone:zone];
        }
    });
    return tool;
}
-(id)copyWithZone:(NSZone *)zone{
    return [NetworkTool shareNetworkTool];
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return [NetworkTool shareNetworkTool];
}
@end
