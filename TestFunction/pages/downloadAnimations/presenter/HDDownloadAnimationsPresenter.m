//
//  HDDownloadAnimationsPresenter.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/15.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDDownloadAnimationsPresenter.h"
#import "HDFileManager.h"
#import "ZipArchive.h"
#import <AFNetworking/AFNetworking.h>

@interface HDDownloadAnimationsPresenter()<SSZipArchiveDelegate>
@property (nonatomic ,weak) id<HDDownloadAnimationPresenterProtocal> delegate;
@end
@implementation HDDownloadAnimationsPresenter

//    http://b.t.zmengzhu.com/app/gift/getGiftSpecialUrl
- (instancetype)initWithDelegate:(id<HDDownloadAnimationPresenterProtocal>) delegate;{
    if (self == [super init]) {
        self.delegate = delegate;
    }
    return self;
}
- (void)presenterLoadData;{
    [[AFHTTPSessionManager manager] GET:@"http://b.t.zmengzhu.com/app/gift/getGiftSpecialUrl" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"接口请求成功");
         NSLog(@"%@",responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"接口请求失败 %@--- %@",task,error.domain);
    }];
    
}
- (void)doBusiness{
    
    
    NSDictionary *parameter = @{@"url":@"http://s1.t.zmengzhu.com/business/special/ios/v3.6.2/animation.zip",
                                //        @"fileId":@"11",
                                @"fileName":@"11",
                                };
    [HDFileManager downloadFile:parameter downloadSuccess:^(NSURLResponse * _Nonnull response, NSURL * _Nonnull filePath) {
        
        NSLog(@"filePath:%@",[[filePath absoluteString] substringFromIndex:7]);
        //        取文件
        NSString *zipPath = [[filePath absoluteString] substringFromIndex:7];
        //        解析
        // Unzip
        
        NSString *unzipPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSLog(@"unzipPath:       %@",unzipPath);
        
        if ([SSZipArchive unzipFileAtPath:zipPath  toDestination:unzipPath delegate:self]){
            NSLog(@"解压成功");
        }
        else {
            NSLog(@"解压失败");
        }
    
        //        展示
        
    } downloadFailure:^(NSError * _Nonnull error) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    }];
}
#pragma mark - SSZipArchiveDelegate
- (void)zipArchiveWillUnzipArchiveAtPath:(NSString *)path zipInfo:(unz_global_info)zipInfo {
    NSLog(@"将要解压。");
}

- (void)zipArchiveDidUnzipArchiveAtPath:(NSString *)path zipInfo:(unz_global_info)zipInfo unzippedPath:(NSString *)unzippedPat uniqueId:(NSString *)uniqueId {
    NSLog(@"解压完成！");
}
@end
