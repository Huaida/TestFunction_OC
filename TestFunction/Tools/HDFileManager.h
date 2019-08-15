//
//  HDFileManager.h
//  TestFunction
//
//  Created by 怀达 on 2019/8/14.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDFileManager : NSObject
+ (void)downloadFile:(NSDictionary *)params
     downloadSuccess:(void (^)(NSURLResponse *response, NSURL *filePath))success
     downloadFailure:(void (^)(NSError *error))failure
    downloadProgress:(void (^)(NSProgress *downloadProgress))progress;

+ (BOOL) isFileExist: (NSDictionary *)params;

+ (void)removeDirectoryPath:(NSString *)directoryPath;

+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger totalSize))completion;
+ (NSString *)cacheSizeStr: (NSInteger)totalSize;

+ (void)previewFile: (NSDictionary *)params;
@end

NS_ASSUME_NONNULL_END
