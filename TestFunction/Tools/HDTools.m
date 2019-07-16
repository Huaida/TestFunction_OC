//
//  HDTools.m
//  TestFunction
//
//  Created by 怀达 on 2019/7/16.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDTools.h"

@implementation HDTools
//字符串是否没超出规定字节数
+ (BOOL)isLealString:(NSString *)string limitStringSizeOf:(int)limitNumber
{
    int  currentStringSizeOf = [HDTools convertToInt:string];
    //    NSLog(@"int = %d  str = %@",currentStringSizeOf,string);
    if (currentStringSizeOf <= limitNumber)
        return YES;
    else
        return NO;
}
//判断中英混合的的字符串长度
+ (int)convertToInt:(NSString*)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    return strlength;
}
+(BOOL)isFloat:(NSString *)floatstr {
    NSString *emailRegex = @"^(([0-9]{1,10}+)|([0-9]+\\.[0-9]{1,2})|([0-9]+\\.)|(\\.)|(\\.[0-9]{1,2}))$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:floatstr];
}
//限制字数
+(NSString *)limitString:(NSString *)string sizeOf:(int)limitNumber
{
    NSString * tempStr;
    if ([HDTools isLealString:string limitStringSizeOf:limitNumber]) {
        return string;
    }
    else {
        for (int i = (int)string.length ; i > 0 ; i--) {
            tempStr = [string substringToIndex:i];
            if ([HDTools isLealString:tempStr limitStringSizeOf:limitNumber]) {
                break;
            }
        }
    }
    return tempStr;
}

@end
