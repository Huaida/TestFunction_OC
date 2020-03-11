//
//  NSBundle+CLLanguage.m
//  CLDemo
//
//  Created by AUG on 2018/11/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import "NSBundle+CLLanguage.h"
#import <objc/runtime.h>
//#import "CLLanguageManager.h"

static NSString *CLUserLanguageKey = @"CLUserLanguageKey";

@interface CLBundle : NSBundle

@end


@implementation CLBundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    if ([CLBundle cl_mainBundle]) {
        return [[CLBundle cl_mainBundle] localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}
// 定位国际化文件路径
+ (NSBundle *)cl_mainBundle {
    if ([NSBundle currentLanguage].length) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSBundle currentLanguage] ofType:@"lproj"];
        if ([self isChineseLanguage]) {
            path = [[NSBundle mainBundle] pathForResource:@"zh-Hans" ofType:@"lproj"];
        }
        if (path.length) {
            return [NSBundle bundleWithPath:path];
        }
    }
    return nil;
}

@end


@implementation NSBundle (CLLanguage)
+ (void)setUserLanguage:(NSString *)userLanguage {
    //跟随手机系统
    if (!userLanguage.length) {
        [self resetSystemLanguage];
        return;
    }
    //用户自定义
    [[NSUserDefaults standardUserDefaults] setValue:userLanguage forKey:CLUserLanguageKey];
//    [[NSUserDefaults standardUserDefaults] setValue:@[userLanguage] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 重置系统语言
 */
+ (void)resetSystemLanguage {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:CLUserLanguageKey];
//    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isChineseLanguage {// 中文又多种格式需要判断
    NSString *currentLanguage = [self currentLanguage];
    if ([currentLanguage hasPrefix:@"zh-Hans"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)currentLanguage {
     NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] valueForKey:CLUserLanguageKey];
    return currentLanguage ? currentLanguage : [NSLocale preferredLanguages].firstObject;// project预设的文字
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //动态继承、交换，方法类似KVO，通过修改[NSBundle mainBundle]对象的isa指针，使其指向它的子类CLBundle，这样便可以调用子类的方法；其实这里也可以使用method_swizzling来交换mainBundle的实现，来动态判断，可以同样实现。
        object_setClass([NSBundle mainBundle], [CLBundle class]);
    });
}

@end
