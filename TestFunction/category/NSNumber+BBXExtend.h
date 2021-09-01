//
//  NSNumber+BBXExtend.h
//  Bbx_Appstore
//
//  Created by sh01p on 2021/3/17.
//  Copyright © 2021 iBBX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber(BBXExtend)

/**
 *  @brief 截取浮点数,向下取整 (例如保留小数点后三位的结果 0.1256 = 0.125)
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_stringWithRoundDownDigits:(NSString * _Nullable)number keepPlaces:(short)place;

/**
 *  @brief 四舍五入取整  
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_stringWithRoundPlainDigits:(NSString * _Nullable)number keepPlaces:(short)place;

/**
 *  @brief 截取浮点数,向下取整 (例如保留小数点后三位的结果 0.1256 = 0.125)
 *
 *  @param number 浮点数对象
 *  @param precision @"0.0000" 的格式
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_stringWithRoundDownDigits:(NSString *)number precision:(NSString*)precision;
/**
 *  @brief 截取浮点数,向上取整 (例如保留小数点后三位的结果 0.1256 = 0.126)
 *
 *  @param number 浮点数对象
 *  @param precision @"0.0000" 的格式
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_stringWithRoundUpDigits:(NSString *)number precision:(NSString*)precision;
/**
 *  @brief 截取浮点数,向下取整 (例如保留小数点后三位的结果 0.1256 = 0.125)
 *
 *  @param number 浮点数对象
 *  @param precision @"0.0000" 的格式
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_formatStringWithRoundDownDigits:(NSString *)number precision:(NSString*)precision;
/**
 *  @brief 四舍五入取整
 *
 *  @param number 浮点数对象
 *  @param precision @"0.0000" 的格式
 *
 *  @return 返回NSString格式化数值字符串
 */
+ (NSString *)bbx_formatStringWithRoundPlainDigits:(NSString *)number precision:(NSString*)precision;
/**
 *  @brief 四舍五入取整
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString格式化数值字符串
 */
+ (NSString * _Nullable)bbx_formatStringWithRoundPlainDigits:(NSString * _Nullable)number keepPlaces:(short)place;

/**
 *  @brief 截取浮点数,向下取整 (例如保留小数点后三位的结果 0.1256 = 0.125)
 *
 *  @param number 浮点数对象
 *  @param place 小数点后的保留的位数
 *
 *  @return 返回NSString字符串
 */
+ (NSString * _Nullable)bbx_formatStringWithRoundDownDigits:(NSString * _Nullable)number keepPlaces:(short)place;


/// 格式化千百万
/// @param place 精度
+ (NSString *)bbx_trillionStringWithStringDigits:(NSString *)number keepPlaces:(short)place;

/// 格式化千百万
/// @param precision 精度
+ (NSString *)bbx_trillionWithStringDigits:(NSString *)number precision:(NSString*)precision;

@end

NS_ASSUME_NONNULL_END
