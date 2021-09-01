//
//  NSString+BBXTool.m
//  BBX_Pro
//
//  Created by Cage on 2020/5/14.
//  Copyright © 2020 BBX_Daniel. All rights reserved.
//

#import "NSString+BBXTool.h"

@implementation NSString  (BBXTool)



// 百分比字符串
- (NSString *)bbx_toPercentString:(int)pointCount {
    NSString* number  = [self bbx_multiply:@"100.0"];
    NSString* percent = [NSNumber bbx_stringWithRoundDownDigits:number keepPlaces:pointCount];
    return [NSString stringWithFormat:@"%@%%",percent];
}


// 四舍五入
- (NSString*)bbx_rounding:(int)pointCount;{
    
    if ( nil == self ) {
        return @"";
    }
    
    NSRange range = [self rangeOfString:@"."];
    if (range.location == NSNotFound) {
        if (pointCount > 0) {
            //  需要修改的数是整数，需要后面补零
            NSMutableString *zero = [[NSMutableString alloc] initWithString:@"."];
            for (int i = 0; i < pointCount; i++) {
                [zero appendString:@"0"];
            }
            return [NSString stringWithFormat:@"%@%@",self,zero];
        }else{
            return self;
        }

    }
    if (pointCount <= 0) {
//        取整数
        return [self decimalwithFormat:@"0" floatV:self.doubleValue];
    }
    
//    正常小数判断
    NSArray *arr = [self componentsSeparatedByString:@"."];
    if (arr.count != 2) {
        return self;
    }
    
    NSString *high = [arr firstObject];
    NSString *low = [arr lastObject];
//    low 是小数位数
    if (low.length <= pointCount ) {
//        尾部加0
        NSString *format = [NSString stringWithFormat:@"%%.%df%%",pointCount];
        return [NSString stringWithFormat:format,self.doubleValue];
    }
    else{
        
        //四舍五入尾部
        NSMutableString *zero = @"0".mutableCopy;
        for (int i = 1; i < pointCount; i++) {
            [zero appendString:@"0"];
        }
        NSString *FM = [NSString stringWithFormat:@"0.%@",zero];
        
        //fixme
        //当 self = @"-0.00000000000001"; pointCount = 8
        //导致一个非常小的负数被解析成 -0.00000000的形式
        //2020-12-21 by sh01p
        
        double value = self.doubleValue;
        if([self containsString:FM] && [high isEqual:@"-0"]){
            value = 0;
        }
        NSString * numValue = [self decimalwithFormat:FM floatV:value];
        return numValue;
        
    }
}
- (NSString *)decimalwithFormat:(NSString *)format floatV:(double)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    return  [numberFormatter stringFromNumber:[NSNumber numberWithDouble:floatV]];
}
// 向下取整
- (NSString *)bbx_roundDown{
    return  [NSString stringWithFormat:@"%.0f",floor(self.doubleValue)];
}
// 向上取整
- (NSString *)bbx_roundUp{
    return  [NSString stringWithFormat:@"%.0f",ceil(self.doubleValue)];
}
// 四舍五入
- (NSString *)bbx_round{
    return  [NSString stringWithFormat:@"%.0f",round(self.doubleValue)];
}
#pragma mark - 大数运算
-(BOOL) bbx_isEqualTo:(NSString *)right{
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    if ( [leftM compare:rightM] == 0) {
        return YES;
    }
    return NO;
}
-(BOOL) bbx_equalZero{
    NSDecimalNumber *d = [NSDecimalNumber decimalNumberWithString:self];
    if ( [d compare:NSDecimalNumber.zero] ==0) {
        return YES;
    }
    return NO;
}
- (BOOL) bbx_LessThanOrEqualZero{
    NSDecimalNumber *d = [NSDecimalNumber decimalNumberWithString:self];
    if ( [d compare:NSDecimalNumber.zero] <=0) {
        return YES;
    }
    return NO;
}
- (BOOL) bbx_LessThan:(NSString*)right{
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    if ( [leftM compare:rightM] <0) {
        return YES;
    }
    return NO;
}
- (BOOL) bbx_LessThanOrEqual:(NSString*)right{
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    if ( [leftM compare:rightM] <=0) {
        return YES;
    }
    return NO;
}
- (BOOL) bbx_GreaterThan:(NSString*)right{
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    if ( [leftM compare:rightM] >0) {
        return YES;
    }
    return NO;
}
- (BOOL) bbx_GreaterThanOrEqual:(NSString*)right{
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    if ( [leftM compare:rightM] >=0) {
        return YES;
    }
    return NO;
}

//// 大数乘
- (NSString*)bbx_multiply:(NSString *)value{
    if (nil == self || nil == value) {
        return @"0";
    }
    if (self.doubleValue == 0 || value.doubleValue == 0) {
        return @"0";
    }
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundDown
                                       scale:12
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    NSDecimalNumber *mulRes = [leftM decimalNumberByMultiplyingBy:rightM withBehavior:roundUp];
    
    NSString * resStr = [mulRes stringValue];
    return  resStr;
}
// 大数除
- (NSString *)bbx_dividedBy:(NSString*)right;{
    if (nil == self || nil == right) {
        return @"0";
    }
    if (right.doubleValue == 0) {
        return @"0";
    }
    
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundDown
                                       scale:12
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    NSDecimalNumber *divRes = [leftM decimalNumberByDividingBy:rightM withBehavior:roundUp];
    NSString *resStr = [divRes stringValue];
    
    return resStr;
}
// 大数加
- (NSString *)bbx_add:(NSString*)right;{
    if (nil == self && nil == right) {
        return @"0";
    }
    if ([right isEqualToString:@""]) {
        return self;
    }
    NSDecimalNumber *leftM = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightM = [NSDecimalNumber decimalNumberWithString:right];
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundDown
                                       scale:12
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    NSDecimalNumber *addRes = [leftM decimalNumberByAdding:rightM withBehavior:roundUp];
    NSString * resStr  = [addRes stringValue];
    return resStr;
}


- (NSInteger)bbx_getUnit;{
    if (!self ) {
        return 0;
    }
    if ([self containsString:@"."]) {
        NSArray *array = [self componentsSeparatedByString:@"."];
        int count = 0;
        if (array.count != 2) {
            return 0;
        }
        NSString *rightStr = array[1];
        count = (int)rightStr.length;
        return count;
    }else{
        return 0;
    }
}
-(NSString*)bbx_OriginalStringToNumberFormatter{
    
    //TODO.
    //新方式,检验下会不会有bug
    return [self bbx_standardNumberString];
    
//    NSString *numString = [NSString stringWithFormat:@"%@",self];
//    if ([numString containsString:@"."]) {
////        小数
//        NSArray *componentArray = [numString componentsSeparatedByString:@"."];
//        if (componentArray.count != 2) {
//            return self;
//        }
//       NSString *integerPart = [self integerPartAddThousandSign:componentArray.firstObject];
//        return [NSString stringWithFormat:@"%@.%@",integerPart,[componentArray objectAtIndex:1]];
//    }else{
////        整数
//        return [self integerPartAddThousandSign:self];
//    }
//
//    return self;
}
// 整数部分加 千分位符
- (NSString *)integerPartAddThousandSign:(NSString *)integerPart{
    NSString *negative = nil;
    if ([integerPart containsString:@"-"]) {
        negative = @"-";
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    NSNumber *number = [formatter numberFromString:integerPart];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *string = [formatter stringFromNumber:number];
    if(kIsStrEmpty(string)) {
        return self;
    }
    if ([string containsString:@"-"]) {
        return string;
    }else{
        if (negative) {
            
            return [NSString stringWithFormat:@"%@%@",negative,string];
        }else{
            return string;
        }
    }
}

-(NSString*)bbx_NumberFormatterToOriginalString{
   NSString *numString = [NSString stringWithFormat:@"%@",self];
   return [numString stringByReplacingOccurrencesOfString:@"," withString:@""];
}
// 向下取整
- (NSString *)bbx_precision_unit_roundDown:(NSString*)price_unit;{
    return [NSNumber bbx_stringWithRoundDownDigits:self precision:price_unit];
}
// 向上取整
- (NSString *)bbx_precision_unit_roundUp:(NSString*)price_unit;{
    return [NSNumber bbx_stringWithRoundUpDigits:self precision:price_unit];
}

// 四舍五入  精度不足补0
- (NSString*)bbx_toString:(int)pointCount {
    
    pointCount = MAX(0, pointCount);
    
    if ( nil == self ) {
        return @"";
    }
    NSRange range = [self rangeOfString:@"."];
    
    if (range.location == NSNotFound) {
//        整数没有小数点
        if (pointCount > 0) {
            //后面补零
            NSMutableString *zero = [[NSMutableString alloc] initWithString:@"."];
            for (int i = 0; i < pointCount; i++) {
                [zero appendString:@"0"];
            }
            return [NSString stringWithFormat:@"%@%@",self,zero];
        }
        else{
//            pointCount == 0
            return self;// 返回整数本身
        }

    }
    
    if (pointCount == 0) {
//        取整数
        return [self decimalwithFormat:@"0" floatV:self.doubleValue];
    }
    
//    正常小数判断 1.24567
    NSArray *arr = [self componentsSeparatedByString:@"."];
    if (arr.count != 2) {
//        小数不合法
        return self;
    }
    
    NSString *low = arr[1];
//    low 是小数位数
    if (low.length <= pointCount ) {
//        尾部加0
        NSString *format = [NSString stringWithFormat:@"%%.%df%%",pointCount];
        return [NSString stringWithFormat:format,self.doubleValue];
    }else{
//        四舍五入尾部
        NSMutableString *zero = [[NSMutableString alloc] initWithString:@"0"];
        for (int i = 1; i < pointCount; i++) {
            [zero appendString:@"0"];
        }
        NSString *FM = [NSString stringWithFormat:@"0.%@",zero];
        return [self decimalwithFormat:FM floatV:self.doubleValue];
    }
}
- (NSString *)bbx_encodeToPercentEscapeString
{
    //编码
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];;
}
- (NSString *)bbx_decodeToPercentEscapeString
{
  //解码
    return [self stringByRemovingPercentEncoding];
}




-(NSDate*)bbx_dateFromUTCString{
    
    NSDate *ret = nil;
    
    if(self.length > 0){
        NSDateFormatter *f = [[NSDateFormatter alloc] init];
        [f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
        [f setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        ret = [f dateFromString:self];
    }

    if (ret == nil) {
        ret = [NSDate date];
        NSLog(@"Error formatting date (%@)",self);
    }
    return ret;
}

-(NSString*)bbx_dateStringFromUTCTime{
    
    NSDate* nowDate = [NSDate date];
    NSTimeZone *sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:nowDate];
    NSInteger destinationGMTOffset = [localTimeZone secondsFromGMTForDate:nowDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    [formatter setTimeZone:sourceTimeZone];
    NSDate* date = [formatter dateFromString:self];
    
    NSDate* destinationDateNow = [date dateByAddingTimeInterval:interval];
    
    formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm"];
    [formatter setTimeZone:sourceTimeZone];
    return [formatter stringFromDate:destinationDateNow];
    
}

//UNix时间戳处理
- (NSString *)bbx_dataFromUNIXTimestamp;{

    //将对象类型的时间转换为NSDate类型

    double time = [self integerValue];

    NSDate * myDate=[NSDate dateWithTimeIntervalSince1970:time];

    //设置时间格式

    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];

    [formatter setDateFormat:@"HH:mm:ss"];

    //将时间转换为字符串

    NSString *timeStr=[formatter stringFromDate:myDate];

    return timeStr;

}
/// 乘法运算
/// @param value 乘以的值


/// 加法运算



- (NSString *)bbx_subtract:(NSString *)value{
    
    if (nil == self) {
        return @"0";
    }
    
    if (value == nil || value.doubleValue == 0) {
        return self;
    }
    
    NSDecimalNumber *leftNumber  = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *rightNumber = [NSDecimalNumber decimalNumberWithString:value];
    NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler
                                        decimalNumberHandlerWithRoundingMode:NSRoundDown
                                        scale:12
                                        raiseOnExactness:NO
                                        raiseOnOverflow:NO
                                        raiseOnUnderflow:NO
                                        raiseOnDivideByZero:YES];
    NSDecimalNumber *result = [leftNumber decimalNumberBySubtracting:rightNumber withBehavior:behavior];
    NSString * resultString  = [result stringValue];
    return resultString;
}

- (CGFloat)bbx_stringHeightWithFont:(UIFont*)font
                           maxWidth:(CGFloat)width
                        lineSpacing:(CGFloat)lineSpacing
                  minimumLineHeight:(CGFloat)minimumLineHeight{
    CGSize textSize = [self bbx_stringSizeWithFont:font
                                          maxWidth:width
                                       lineSpacing:lineSpacing
                                 minimumLineHeight:minimumLineHeight];
    return textSize.height;
}

- (CGSize)bbx_stringSizeWithFont:(UIFont*)font
                        maxWidth:(CGFloat)maxWidth
                     lineSpacing:(CGFloat)lineSpacing
               minimumLineHeight:(CGFloat)minimumLineHeight{
    
    CGSize size = CGSizeMake(maxWidth, CGFLOAT_MAX);
    NSMutableParagraphStyle* paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    paragraph.minimumLineHeight = minimumLineHeight;
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin |  NSStringDrawingUsesFontLeading
                                  attributes:@{NSFontAttributeName: font,NSParagraphStyleAttributeName : paragraph}
                                     context:nil];
    return rect.size;
}

-(NSString*)bbx_abs{
    
    NSString* number = self;
    if([number hasPrefix:@"-"]){
        number = [number stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    return number;
}


-(NSInteger)bbx_getNumberDecimalPlaces:(NSString*)precisionUnit{
    return [precisionUnit bbx_getUnit];
}

-(NSString*)bbx_numberStringWithDecimalPlaces:(NSInteger)count{
    return  [self bbx_toString:(int)count];
}

-(NSString*)bbx_numberStringWithPrecisionUnit:(NSString*)precisionUnit{
    NSString* number =  [self bbx_precision_unit_roundDown:precisionUnit];
    return number;
}

-(NSString*)bbx_standardNumberString{
    if(self == nil || self.length == 0){
        return @"";
    }


    //确保在格式化时，已经存在的 0.0000 不被转化为 0
    NSInteger minimumFractionDigits = 0;
    NSUInteger location = [self rangeOfString:@"."].location;
    if(location != NSNotFound){
        minimumFractionDigits = self.length - location - 1;
    }


    NSString *numberString = self ;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.roundingMode = NSNumberFormatterRoundDown;
    formatter.minimumIntegerDigits = 1;
    formatter.minimumFractionDigits = minimumFractionDigits;

    NSNumber *number = [formatter numberFromString:numberString];
    NSString *string = [formatter stringFromNumber:number];

    return string;
}

-(NSString*)bbx_standardNumberStringWithPrecisionUnit:(NSString*)precisionUnit{
    NSString* number =  [self bbx_numberStringWithPrecisionUnit:precisionUnit];
    return [number bbx_standardNumberString];
}


-(NSString*)bbx_standardNumberStringWithDecimalPlaces:(NSInteger)decimalPlaces{
    NSString* number = [self bbx_rounding:decimalPlaces];
    return [number bbx_standardNumberString];
}


@end
