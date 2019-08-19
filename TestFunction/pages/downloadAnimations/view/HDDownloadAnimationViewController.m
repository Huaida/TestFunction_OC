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
//            修改iOS 文件夹名称
            [self renameFolder:@"v3.6.2"];
//            [self writeToFile];
//            [self readFile];
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
#pragma mark  -  修改文件名 删除文件 创建文件 修改文件夹名称 测试
- (void)renameFolder:(NSString *)version{
//    方案移动到 同一路径下新的文件夹中
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *oldFolderPath = [docPath stringByAppendingString:@"/animation"];
    NSString *newFolderPath = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/animation%@",version]];
     NSLog(@"%@-%@",oldFolderPath, newFolderPath);
//    把现有的文件移动上新的
    [self renameFileName:oldFolderPath toNewName:newFolderPath];
    
}
-(BOOL)deleteFileByPath:(NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL res=[fileManager removeItemAtPath:path error:nil];
    return res;
//    NSLog(@"文件是否存在: %@",[fileManager isExecutableFileAtPath:path]?@"YES":@"NO");
}
//根据路径复制文件
+(BOOL)copyFile:(NSString *)path topath:(NSString *)topath
{
    
    BOOL result = NO;
    NSError * error = nil;
    
    result = [[NSFileManager defaultManager]copyItemAtPath:path toPath:topath error:&error ];
    
    if (error){
        NSLog(@"copy失败：%@",[error localizedDescription]);
    }
    return result;
}
//根据路径剪切文件
+(BOOL)cutFile:(NSString *)path topath:(NSString *)topath
{
    
    BOOL result = NO;
    NSError * error = nil;
    result = [[NSFileManager defaultManager]moveItemAtPath:path toPath:topath error:&error ];
    if (error){
        NSLog(@"cut失败：%@",[error localizedDescription]);
    }
    return result;
    
}
//根据路径获取该路径下所有目录
+(NSArray *)getAllFileByName:(NSString *)path
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSArray *array = [defaultManager contentsOfDirectoryAtPath:path error:nil];
    return array;
}
//根据路径获取文件目录下所有文件
+(NSArray *)getAllFloderByName:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray * fileAndFloderArr = [self getAllFileByName:path];
    
    NSMutableArray *dirArray = [[NSMutableArray alloc] init];
    BOOL isDir = NO;
    //在上面那段程序中获得的fileList中列出文件夹名
    for (NSString * file in fileAndFloderArr){
        
        NSString *paths = [path stringByAppendingPathComponent:file];
        [fileManager fileExistsAtPath:paths isDirectory:(&isDir)];
        if (isDir) {
            [dirArray addObject:file];
        }
        isDir = NO;
    }
    return dirArray;
}
//获取文件及目录的大小
+(float)sizeOfDirectory:(NSString *)dir{
    NSDirectoryEnumerator *direnum = [[NSFileManager defaultManager] enumeratorAtPath:dir];
    NSString *pname;
    int64_t s=0;
    while (pname = [direnum nextObject]){
        //NSLog(@"pname   %@",pname);
        NSDictionary *currentdict=[direnum fileAttributes];
        NSString *filesize=[NSString stringWithFormat:@"%@",[currentdict objectForKey:NSFileSize]];
        NSString *filetype=[currentdict objectForKey:NSFileType];
        
        if([filetype isEqualToString:NSFileTypeDirectory]) continue;
        s=s+[filesize longLongValue];
    }
    return s*1.0;
}
//重命名文件或目录  原理：ios下不会保留空文件夹，所以移动文件夹下所有文件去新文件夹，实际上附带是删除本文件夹操作，如果新旧文件夹在同一个目录下，从而达到重命名的效果
-(BOOL)renameFileName:(NSString *)oldPath toNewName:(NSString *)newPath
{
    BOOL result = NO;
    NSError * error = nil;
    result = [[NSFileManager defaultManager] moveItemAtPath:oldPath toPath:newPath error:&error];
    if (error){
        NSLog(@"重命名失败：%@",[error localizedDescription]);
    }
    return result;
}

- (void)writeToFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    if (!docDir) {
        NSLog(@"Documents 目录未找到");
    }
    NSArray *array = [[NSArray alloc] initWithObjects:@"内容",@"content",nil];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
    [array writeToFile:filePath atomically:YES];
    
//    写入的文件是xml类型
//    <?xml version="1.0" encoding="UTF-8"?>
//    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
//    <plist version="1.0">
//    <array>
//    <string>内容</string>
//    <string>content</string>
//    </array>
//    </plist>

}
- (void)readFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"testFile.txt"];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:filePath];
    NSLog(@"%@", array);
}
@end
