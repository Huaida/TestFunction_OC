//
//  NSObject+run.m
//  TestFunction
//
//  Created by 怀达 on 2019/3/26.
//  Copyright © 2019 white. All rights reserved.
//

#import "NSObject+run.h"

@implementation NSObject (run)
- (void)run;{
     NSLog(@"%@ object run",[self class]);
}
- (id)objectAtIndexedSubscript:(NSUInteger)idx{
     NSLog(@"%@",@"     - (id)sxy_objectAtIndexedSubscript:(NSUInteger)idx");
    return nil;
}
@end
