//
//  NSString+BBXTool.h
//  BBX_Pro
//
//  Created by Cage on 2020/5/14.
//  Copyright © 2020 BBX_Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

@interface NSString (BBXTool)


//小数转为百分数，pointCount小数位数
- (NSString *)bbx_toPercentString:(int)pointCount;
- (BOOL)bbx_equalZero;
- (BOOL)bbx_LessThanOrEqualZero;
- (BOOL)bbx_LessThan:(NSString*)right;
- (BOOL)bbx_LessThanOrEqual:(NSString*)right;
- (BOOL)bbx_GreaterThan:(NSString*)right;
- (BOOL)bbx_GreaterThanOrEqual:(NSString*)right;
- (BOOL)bbx_isEqualTo:(NSString *)right;







//原始字符串增加千分位符
- (NSString*)bbx_OriginalStringToNumberFormatter;
//千分位符字符串恢复为原始字符串
- (NSString*)bbx_NumberFormatterToOriginalString;


// 获取小数位数
- (NSInteger)bbx_getUnit;

//精度处理 向下取整 123.451 精度0.01 结果123.46 精度后有值，最后一位加一
- (NSString *)bbx_precision_unit_roundDown:(NSString*)price_unit;
//精度处理 向上取整 123.451 精度0.01 结果123.45 精度后有值，直接截断
- (NSString *)bbx_precision_unit_roundUp:(NSString*)price_unit;
//向下取整数
- (NSString *)bbx_roundDown;
// 向上取整数
- (NSString *)bbx_roundUp;
// 四舍五入取整数
- (NSString *)bbx_round;
//小数四舍五入
- (NSString*)bbx_rounding:(int)pointCount;
//URL 中文特殊字符编码
- (NSString *)bbx_encodeToPercentEscapeString;
- (NSString *)bbx_decodeToPercentEscapeString;

- (CGSize)bbx_stringSizeWithFont:(UIFont*)font
                        maxWidth:(CGFloat)maxWidth
                     lineSpacing:(CGFloat)lineSpacing
               minimumLineHeight:(CGFloat)minimumLineHeight;



#pragma mark - 时间
- (NSDate*)bbx_dateFromUTCString;
-(NSString*)bbx_dateStringFromUTCTime;
- (NSString *)bbx_dataFromUNIXTimestamp;

// 大数除
- (NSString *)bbx_dividedBy:(NSString*)right;
// 大数加
- (NSString *)bbx_add:(NSString*)right;
/// 减法运算
/// @param value 减去的值
- (NSString*)bbx_subtract:(NSString *)value;

/// 乘法运算
/// @param value 乘以的值
- (NSString*)bbx_multiply:(NSString *)value;



/// 绝对值计算
-(NSString*)bbx_abs;

/// 获取数值精度长度
-(NSInteger)bbx_getNumberDecimalPlaces:(NSString*)precisionUnit;

/// 保留指定小数位
-(NSString*)bbx_numberStringWithDecimalPlaces:(NSInteger)count;

/// 以指定精度转换后的数值
-(NSString*)bbx_numberStringWithPrecisionUnit:(NSString*)precisionUnit;

/// bbx标准数值格式
-(NSString*)bbx_standardNumberString;

/// 以指定精度转换后的,bbx标准数值格式  向下截取
-(NSString*)bbx_standardNumberStringWithPrecisionUnit:(NSString*)precisionUnit;

-(NSString*)bbx_standardNumberStringWithDecimalPlaces:(NSInteger)decimalPlaces;

@end

NS_ASSUME_NONNULL_END
