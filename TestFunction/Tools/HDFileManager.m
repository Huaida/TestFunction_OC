//
//  HDFileManager.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDFileManager.h"
#import <AFNetworking.h>
#import "Constant.h"

@implementation HDFileManager
+ (BOOL) isFileExist: (NSDictionary *)params
{
    NSString *fileId;
    if (strIsEmpty(params[@"fileId"])) {
        NSAssert(NO, @"参数错误");
    }
    fileId = [params[@"fileId"] stringByReplacingOccurrencesOfString:@"." withString:@""];
    [HDFileManager createContactFilePath];
    NSString *dir = [[HDFileManager contactPath] stringByAppendingPathComponent: fileId];
    BOOL result = [HDFileManager fileExistAtPath: dir];
    return result;
}

+ (void)downloadFile:(NSDictionary *)params
     downloadSuccess:(void (^)(NSURLResponse *response, NSURL *filePath))success
     downloadFailure:(void (^)(NSError *error))failure
    downloadProgress:(void (^)(NSProgress *downloadProgress))progress

{
    //分割获取下载链接和参数
    NSString *requestURLString;
    NSString *fileId;
    NSString *fileName;
   
    requestURLString = params[@"url"];
//    fileId = [params[@"fileId"] stringByReplacingOccurrencesOfString:@"." withString:@""];
    fileName = params[@"fileName"];
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
    NSURL *url = [NSURL URLWithString:requestURLString];
    
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //4.下载任务
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //打印下下载进度
        progress(downloadProgress);
                NSLog(@"打印下下载进度:%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//        指定下载地址
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent: @"jsonAnimation.zip"];
        return [NSURL fileURLWithPath:fullPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"完成cache：%@",filePath);
        NSHTTPURLResponse *response1 = (NSHTTPURLResponse *)response;
        NSInteger statusCode = [response1 statusCode];
        if (statusCode == 200) {
            //文件保存到指定目录
//            [HDFileManager saveFile:filePath directoryName: fileId fileName: fileName complete:^(BOOL result) {
//                if (result) {
                    success(response, filePath);
//                }
//            }];
        }else{
            failure(error);
        }
        
    }];
    
    //5.开始启动下载任务
    [task resume];
}


/**
 保存文件到contactFile
 
 @param filePath af下载的缓存文件路径
 @param directoryName 保存的文件夹名称
 @param fileName 文件名称
 @param complete 保存成功回调
 */
+ (void)saveFile: (NSURL *)filePath directoryName:(NSString *)directoryName fileName: (NSString *)fileName complete:  (void(^)(BOOL))complete{
    
    NSString *path = [filePath.path stringByReplacingOccurrencesOfString:@"file://" withString:@""];
    complete([HDFileManager moveFileFromPath: path toPathName: directoryName fileName: fileName]);
}

//移动文件
+ (BOOL)moveFileFromPath:(NSString *)filePath toPathName: (NSString *)pathName fileName: (NSString *)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //在contacFile路径下判断pathName是否存在
    NSString *toPath = [[HDFileManager contactPath] stringByAppendingPathComponent:pathName];
    if (![HDFileManager fileExistAtPath:toPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath: toPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *newPath = [toPath stringByAppendingPathComponent: fileName];
    BOOL result = [fileManager moveItemAtPath: filePath toPath: newPath error:nil];
    //    NSLog(@"完成contactFile：%@",newPath);
    return result;
}


+ (void) createContactFilePath {
    
    NSString *filePath = [HDFileManager contactPath];
    if (![HDFileManager fileExistAtPath: filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath: filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}



+ (void)removeDirectoryPath:(NSString *)directoryPath {
    //获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectoey;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectoey];
    
    if (!isExist || !isDirectoey) {
        NSException *exception = [NSException exceptionWithName:@"PathError" reason:@"需要传入的是文件夹路径，并且路径要存在！" userInfo:nil];
        [exception raise];
    }
    //获取cache文件夹下所有文件，不包括子路径的子路径
    NSArray *subPaths = [mgr contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *subPath in subPaths) {
        //拼接完整路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        //删除路径
        [mgr removeItemAtPath:filePath error:nil];
    }
}

+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger totalSize))completion {
    NSFileManager *mgr =[NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isDirectory || !isExist) {
        NSException *exception = [NSException exceptionWithName:@"PathError" reason:@"需要传入的是文件夹路径，并且路径要存在！" userInfo:nil];
        [exception raise];
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //获取文件夹下所有文件，包括子路径的子路径
        NSArray *subPaths = [mgr subpathsAtPath:directoryPath];
        NSInteger totalSize = 0;
        for (NSString *subPath in subPaths) {
            //获取文件全路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            
            //判断隐藏文件
            if ([filePath containsString:@".DS"]) continue;
            
            //判断是否文件夹
            BOOL isDircetory;
            
            //判断文件是否存在，并判断是否是文件夹
            BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDircetory];
            if (isDircetory || !isExist) continue;
            
            //获取文件属性
            NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
            NSInteger size = [attr fileSize];
            
            totalSize += size;
        }
        
        //计算完成回调
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(totalSize);
            }
        });
    });
}

+ (NSString *)cacheSizeStr: (NSInteger)totalSize {
    
    NSString *sizeStr = @"";
    if (totalSize > 1000 * 1000) {
        CGFloat sizeF = totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@%.1fMB", sizeStr, sizeF];
    } else if (totalSize > 1000) {
        CGFloat sizeF = totalSize / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@%.1fKB", sizeStr, sizeF];
    } else if (totalSize > 0) {
        sizeStr = [NSString stringWithFormat:@"%@%.ldB", sizeStr, totalSize];
    }
    return sizeStr;
}


/**
 文件夹是否存在
 
 @param path 文件的目录
 @return bool
 */
+ (BOOL)fileExistAtPath: (NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:path isDirectory:&isDir];
    
    return (isDir == YES && existed == YES);
}

//保存的文件的contactFile路径
+ (NSString *)contactPath{
    return [DocumentsDirectory() stringByAppendingPathComponent: contactFile];
}

+ (void)previewFile: (NSDictionary *)params{
    
    NSString *fileId;
    NSString *fileName;
    if (strIsEmpty(params[@"fileId"]) || strIsEmpty(params[@"fileName"])) {
        NSLog(@"%@", @"参数错误");
    }
    fileId = [params[@"fileId"] stringByReplacingOccurrencesOfString:@"." withString:@""];
    fileName = params[@"fileName"];
    
    NSString *filePath = [[[HDFileManager contactPath] stringByAppendingPathComponent:fileId] stringByAppendingPathComponent:fileName];
//    [[YWFilePreviewController new] previewFileWithPaths:@[filePath] on: root jump:YWJumpPresentAnimat];
}

@end
