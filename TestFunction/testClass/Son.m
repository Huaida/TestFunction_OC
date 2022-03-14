//
//  Son.m
//  TestFunction
//
//  Created by 怀达 on 2019/1/9.
//  Copyright © 2019年 white. All rights reserved.
//

#import "Son.h"

@implementation Son
//@synthesize name = _name;
//- (void)setName:(NSString *)name{
//
//    NSLog(@"son %@",@"应该会走这个setter方法吧");
//
//    _name = [name copy];
//    NSLog(@"%@",_name);
//    [super setName:name];
//
//}
//- (NSString *)name{
//    return _name;
//}
- (void)run;{
    [super run];
    NSLog(@"%@ son  run ",[self class]);
}
- (instancetype)init{
    if (self = [super init]) {
//        self.btn = [[UIButton alloc] init];
//        [self.btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
//- (void)btnPress{
//    [super performSelector:@selector(btnPress)];
//    NSLog(@"%@ press ",[self class]);
//}
- (void)setFathername:(int)name{
    
    NSLog(@"%s",__func__);
}
- (int)fathername{
    NSLog(@"%s",__func__);
    return 1;
}
- (void)setNilValueForKey:(NSString *)key{
     NSLog(@"%s",__func__);
}
- (id)copyWithZone:(NSZone *)zone{
//    [super copyWithZone:zone];
    Son *s = [super copyWithZone:zone];
     NSLog(@"%p",s);
    s.name = @"son name inner";
    return s;
}
@end
