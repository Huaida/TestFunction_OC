//
//  HDDownloadAnimationViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDDownloadAnimationViewController.h"
#import "HDFileManager.h"
#import "SSZipArchive.h"

@interface HDDownloadAnimationViewController ()

@end

@implementation HDDownloadAnimationViewController
//  http://s1.t.zmengzhu.com/business/special/ios/v3.6.2/animation.zip
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self doBusiness];
}
- (void)doBusiness{
     NSLog(@"%@",NSHomeDirectory());
    
    NSDictionary *parameter = @{@"url":@"http://s1.t.zmengzhu.com/business/special/ios/v3.6.2/animation.zip",
//        @"fileId":@"11",
        @"fileName":@"11",
                                };
    [HDFileManager downloadFile:parameter downloadSuccess:^(NSURLResponse * _Nonnull response, NSURL * _Nonnull filePath) {

        NSLog(@"filePath:%@",[[filePath absoluteString] substringFromIndex:7]);
//        取文件
        
//        解析
        // Unzip
        NSString *unzipPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSLog(@"unzipPath:       %@",unzipPath);
        [SSZipArchive unzipFileAtPath:[filePath absoluteString] toDestination:unzipPath];
//        展示
        
    } downloadFailure:^(NSError * _Nonnull error) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    }];
}
@end
