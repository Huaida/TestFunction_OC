//
//  HDNetworkTool.m
//  TestFunction
//
//  Created by 怀达 on 2019/3/9.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDNetworkTool.h"
#import "AFNetWorking.h"

@implementation HDNetworkTool

static HDNetworkTool *tool = nil;

+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tool == nil) {
            
            tool = [[self alloc] init];
        }
    });
    return tool;
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
- (id)copyWithZone:(struct _NSZone *)zone{
    return [[self class] shareManager];
}
- (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return [[self class] shareManager];
}
- (void)hd_Get:(NSString *)url parameters:(NSDictionary *)parameters success:(successBlock)success failure:(failureBlock)failure;
{
    [self Get:url parameters:parameters success:success failure:failure cycle:4];
}
// 添加请求超时重连机制
- (void)Get:(NSString *)url parameters:(NSDictionary *)parameters success:(successBlock)success failure:(failureBlock)failure cycle:(NSInteger)cycle;{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"********************downloadProgress   %@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"***************%@----responseObject%@",task,responseObject);
        NSInteger responseCode = [responseObject[@"code"] integerValue];
        NSLog(@"%ld",(long)responseCode);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
         NSLog(@"***********%@-----%@",task,error);
    }];
    
}

@end
