//
//  main.m
//  TestFunction
//
//  Created by 怀达 on 2018/12/14.
//  Copyright © 2018年 white. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
__attribute__((constructor)) static void beforeMain(){
     NSLog(@"%@",@"beforeMain");
}
static  __attribute__((constructor(101))) void before1()
{
    
    printf("before1\n");
}
static  __attribute__((constructor(102))) void before2()
{
    
    printf("before2\n");
}
static  __attribute__((constructor(88))) void before3()
{
    
    printf("before3\n");
}
