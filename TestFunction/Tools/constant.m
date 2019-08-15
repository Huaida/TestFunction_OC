//
//  constant.m
//  TestFunction
//
//  Created by 怀达 on 2019/8/14.
//  Copyright © 2019 white. All rights reserved.
//

#import "constant.h"

//DocumentsDirectory
inline NSString * DocumentsDirectory(){
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

//CachesDirectory
inline NSString * CachesDirectory(){
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

NSString *const contactFile = @"ContactFile";
NSString *const contactFlag = @"CONTACTFLAG";
