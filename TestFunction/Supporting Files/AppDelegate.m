//
//  AppDelegate.m
//  TestFunction
//
//  Created by 怀达 on 2018/12/14.
//  Copyright © 2018年 white. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HDNavigationController.h"
#import "UINavigationConfig.h"

#ifdef DEBUG
#import <DoraemonKit/DoraemonManager.h>
#endif
@interface AppDelegate ()

@end

@implementation AppDelegate

// 测试ssh 是否被覆盖s
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    self.window.rootViewController = [[HDNavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    // Override point for customization after application launch.
    [UINavigationConfig shared].sx_disableFixSpace = YES;
    [UINavigationConfig shared].sx_defaultFixSpace = 20;
#ifdef DEBUG
    [[DoraemonManager shareInstance] installWithPid:@"04547dd6fa46bb4bbe86445af9a53e28"];//productId为在“平台端操作指南”中申请的产品id
#endif
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
