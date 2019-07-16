//
//  HDTools.h
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDTools : NSObject
//字符串是否没超出规定字节数
+ (BOOL)isLealString:(NSString *)string limitStringSizeOf:(int)limitNumber;
//判断中英混合的的字符串长度
+ (int)convertToInt:(NSString*)strtemp;

+(BOOL)isFloat:(NSString *)floatstr;
//限制字数
+(NSString *)limitString:(NSString *)string sizeOf:(int)limitNumber;
@end

NS_ASSUME_NONNULL_END
