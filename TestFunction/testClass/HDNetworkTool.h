//
//  HDNetworkTool.h
//  TestFunction
//
//  Created by 怀达 on 2019/3/9.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^successBlock)(id responseBody);
typedef void(^failureBlock)(NSString *error);

@interface HDNetworkTool : NSObject
// 单例
+ (instancetype)shareManager;

- (void)hd_Get:(NSString *)url parameters:(NSDictionary *)parameters success:(successBlock)success failure:(failureBlock)failure;
@end

NS_ASSUME_NONNULL_END
