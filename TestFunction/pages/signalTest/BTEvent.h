//
//  BTEvent.h
//  BTStore
//
//  Created by Jason_Lee on 2018/2/3.
//  Copyright © 2018年 Karl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTEvent : NSObject
+ (instancetype)createEvent;
- (void)signal;
- (void)wait;
- (BOOL)waitUntilDate:(NSDate *)limit;
@end
