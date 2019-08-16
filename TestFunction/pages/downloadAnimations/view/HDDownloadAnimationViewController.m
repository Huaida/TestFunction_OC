//
//  HDDownloadAnimationViewController.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDDownloadAnimationViewController.h"
#import "HDFileManager.h"
#import "ZipArchive.h"
#import "HDDownloadAnimationsPresenter.h"
#import <Lottie/Lottie.h>

@interface HDDownloadAnimationViewController ()<SSZipArchiveDelegate,HDDownloadAnimationPresenterProtocal>
@property (nonatomic ,strong) HDDownloadAnimationsPresenter *presenter;
@property (nonatomic, strong) LOTAnimationView *animationView;
@end

@implementation HDDownloadAnimationViewController
//  http://s1.t.zmengzhu.com/business/special/ios/v3.6.2/animation.zip
// /Users/huaida/Library/Developer/CoreSimulator/Devices/A4B114AD-7749-4902-8920-EF670F00BD81/data/Containers/Data/Application/409F1B06-70E0-4FAD-A4F5-D378D500EC4D/Documents/animation/button_gift_666.json
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.presenter = [[HDDownloadAnimationsPresenter alloc] initWithDelegate:self];
    
    
//    _animationView = [LOTAnimationView animationWithFilePath:@"/Users/huaida/Library/Developer/CoreSimulator/Devices/A4B114AD-7749-4902-8920-EF670F00BD81/data/Containers/Data/Application/409F1B06-70E0-4FAD-A4F5-D378D500EC4D/Documents/animation/button_gift_666.json"];
//    _animationView.backgroundColor = [UIColor clearColor];
//    _animationView.bounds = CGRectMake(0, 0, 90.0f*MZ_RATE, 26.0f*MZ_RATE);
//    _animationView.center = CGPointMake(375/2.0, 38.0*MZ_RATE);
//    _animationView.loopAnimation = YES;
//    [_animationView setContentMode:UIViewContentModeScaleAspectFit];
//    [self.view addSubview:_animationView];
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
        NSString *zipPath = [[filePath absoluteString] substringFromIndex:7];
//        解析
        // Unzip
        
        NSString *unzipPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSLog(@"unzipPath:       %@",unzipPath);
//        NSData *zipData = [NSData dataWithContentsOfFile:zipPath];
//         NSLog(@"%@",zipData);
        if ([SSZipArchive unzipFileAtPath:zipPath  toDestination:unzipPath delegate:self]){
            NSLog(@"解压成功");
        }
        else {
            NSLog(@"解压失败");
        }
        
//        [SSZipArchive unzipFileAtPath:[filePath absoluteString] toDestination:unzipPath];
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
