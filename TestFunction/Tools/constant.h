//
//  constant.h
//  TestFunction
//
//  Created by 怀达 on 2019/8/14.
//  Copyright © 2019 white. All rights reserved.
//

#import <Foundation/Foundation.h>

#define strIsEmpty(str)      (str==nil || [str length]==0 || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
#define root [UIApplication sharedApplication].keyWindow.rootViewController

extern NSString * DocumentsDirectory();
extern NSString * CachesDirectory();
extern NSString *const contactFile;
extern NSString *const contactFlag;

