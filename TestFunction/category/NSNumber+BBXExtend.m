//
//  NSNumber+BBXExtend.m
//  Bbx_Appstore
//
//  Created by sh01p on 2021/3/17.
//  Copyright © 2021 iBBX. All rights reserved.
//

#import "NSNumber+BBXExtend.h"

@implementation NSNumber(BBXExtend)


+ (NSString * _Nullable)bbx_stringWithRoundPlainDigits:(NSString *)number precision:(NSString*)precision{
    if([precision hasPrefix:@"0."]){
        NSString* text = [NSNumber bbx_stringWithDigits:number roundingMode:NSRoundPlain keepPlaces:precision.length - 2 fillTails:YES];
        return text;
    }
    return number;
}
+ (NSString * _Nullable)bbx_stringWithRoundDownDigits:(NSString *)number precision:(NSString*)precision{
    if([precision hasPrefix:@"0."]){
        NSString* text = [NSNumber bbx_stringWithDigits:number roundingMode:NSRoundDown keepPlaces:precision.length - 2 fillTails:YES];
        return text;
    }
    return number;
}
+ (NSString * _Nullable)bbx_stringWithRoundUpDigits:(NSString *)number precision:(NSString*)precision{
    if([precision hasPrefix:@"0."]){
        NSString* text = [NSNumber bbx_stringWithDigits:number roundingMode:NSRoundUp keepPlaces:precision.length - 2 fillTails:YES];
        return text;
    }
    return number;
}



+ (NSString * _Nullable)bbx_stringWithRoundDownDigits:(NSString * _Nullable)number keepPlaces:(short)place{
    NSString* text = [NSNumber bbx_stringWithDigits:number roundingMode:NSRoundDown keepPlaces:place fillTails:YES];
    return text;
}

/**
 *  @brief 四舍五入取值
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_stringWithRoundPlainDigits:(NSString * _Nullable)number keepPlaces:(short)place{
    NSString* text = [NSNumber bbx_stringWithDigits:number roundingMode:NSRoundPlain keepPlaces:place fillTails:YES];
    return text;
}

/**
 *  @brief 四舍五入取值
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString格式化数值字符串
 */
+ (NSString * _Nullable)bbx_formatStringWithRoundPlainDigits:(NSString * _Nullable)number keepPlaces:(short)place{
    NSString* text = [NSNumber bbx_stringWithDigits:number roundingMode:NSRoundPlain keepPlaces:place fillTails:YES];
    return text;
}

+ (NSString * _Nullable)bbx_stringWithDigits:(NSString * _Nullable)number roundingMode:(NSRoundingMode)roundingMode keepPlaces:(short)place fillTails:(BOOL)fillTails {

    if(number == nil){
        return number;
    }
    
    if(roundingMode == NSRoundDown){
        if([number hasPrefix:@"-"]){
            roundingMode = NSRoundUp;
        }
    }
    
    NSDecimalNumber * decimalNumber = [NSDecimalNumber decimalNumberWithString:number];
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode
                                                                                                      scale:place
                                                                                           raiseOnExactness:NO
                                                                                            raiseOnOverflow:NO
                                                                                           raiseOnUnderflow:NO
                                                                                        raiseOnDivideByZero:NO];
    decimalNumber = [decimalNumber decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    NSString* text = [decimalNumber stringValue];
    
    if(fillTails){
        text = [NSNumber bbx_stringWithFillTailZerosDigits:text keepPlaces:place];
    }
    
    return text;
    
}

+(NSString*)bbx_stringWithFillTailZerosDigits:(NSString *)number keepPlaces:(short)keepPlaces{
    
    if(number == nil){
        return number;
    }
    
    if(keepPlaces > 0){
        
        NSInteger fillCount = keepPlaces;
        NSUInteger location = [number rangeOfString:@"."].location;
        //浮点数
        if(location != NSNotFound){
            NSInteger tailCount = number.length - location - 1;
            if(tailCount < keepPlaces){
                fillCount = keepPlaces - tailCount;
            }
            else{
                fillCount = 0;
            }
            
            if(fillCount > 0){
                NSString *format = [NSString stringWithFormat:@"%%.%ldf%%",(long)fillCount];
                NSString *tails  = [NSString stringWithFormat:format,0.0f];
                number = [NSString stringWithFormat:@"%@%@",number,[tails substringFromIndex:2]];
            }
        }
        //整数
        else{
            NSString *format = [NSString stringWithFormat:@"%%.%ldf%%",(long)fillCount];
            NSString *tails  = [NSString stringWithFormat:format,0.0f];
            number = [NSString stringWithFormat:@"%@%@",number,[tails substringFromIndex:1]];
        }

    }
    
    return number;
    
}
/**
 *  @brief 截取浮点数,四舍五入取整 (例如保留小数点后三位的结果 0.1256 = 0.126)
 *
 *  @param number 浮点数对象
 *  @param precision @"0.0000" 的格式
 *
 *  @return 返回NSString字符串
 */
+ (NSString *)bbx_formatStringWithRoundPlainDigits:(NSString *)number precision:(NSString*)precision{
    NSString* text = [NSNumber bbx_stringWithRoundPlainDigits:number precision:precision];
    return [text bbx_standardNumberString];
}

/**
 *  @brief 截取浮点数,向下取整 (例如保留小数点后三位的结果 0.1256 = 0.125)
 *
 *  @param number 浮点数对象
 *  @param precision @"0.0000" 的格式
 *
 *  @return 返回NSString字符串
 */
+ (NSString *)bbx_formatStringWithRoundDownDigits:(NSString *)number precision:(NSString*)precision{
    NSString* text = [NSNumber bbx_stringWithRoundDownDigits:number precision:precision];
    return [text bbx_standardNumberString];
}

/**
 *  @brief 截取浮点数,向下取整 (例如保留小数点后三位的结果 0.1256 = 0.125)
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString字符串
 */
+ (NSString *)bbx_formatStringWithRoundDownDigits:(NSString * _Nullable)number keepPlaces:(short)place{
    NSString* text = [NSNumber bbx_stringWithRoundDownDigits:number keepPlaces:place];
    return [text bbx_standardNumberString];
}

+ (NSString *)bbx_trillionStringWithStringDigits:(NSString *)number keepPlaces:(short)place {
    
    if (number.doubleValue >= 1000000) {
        number = [number bbx_dividedBy:@"1000000"];
        NSString* text = [NSNumber bbx_formatStringWithRoundDownDigits:number keepPlaces:place];
        return [NSString stringWithFormat:@"%@M", text];
    }
    else if (number.doubleValue >= 1000) {
        number = [number bbx_dividedBy:@"1000"];
        NSString* text = [NSNumber bbx_formatStringWithRoundDownDigits:number keepPlaces:place];
        return [NSString stringWithFormat:@"%@k", text];
    }
    else {
        NSString* text = [NSNumber bbx_formatStringWithRoundDownDigits:number keepPlaces:place];
        return [NSString stringWithFormat:@"%@", text];
    }

}

+ (NSString *)bbx_trillionWithStringDigits:(NSString *)number precision:(NSString*)precision{
    
    if (number.doubleValue >= 1000000) {
        number = [number bbx_dividedBy:@"1000000"];
        NSString* text = [NSNumber bbx_formatStringWithRoundDownDigits:number precision:precision];
        return [NSString stringWithFormat:@"%@M", text];
    }
    else if (number.doubleValue >= 1000) {
        number = [number bbx_dividedBy:@"1000"];
        NSString* text = [NSNumber bbx_formatStringWithRoundDownDigits:number precision:precision];
        return [NSString stringWithFormat:@"%@k", text];
    }
    else {
        NSString* text = [NSNumber bbx_formatStringWithRoundDownDigits:number precision:precision];
        return [NSString stringWithFormat:@"%@", text];
    }

}
 

@end
