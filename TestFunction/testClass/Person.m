//
//  Person.m
//  TestFunction
//
//  Created by 怀达 on 2018/12/15.
//  Copyright © 2018年 white. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name = _name;
- (instancetype)init{
    if (self = [super init]) {
        _name = @"init name";
        _btn = [[UIButton alloc] init];
        [_btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)btnPress{
     NSLog(@"Person press ",[self class]);
}
//- (NSString *)description{
//    
//    return [NSString stringWithFormat:@"<%@  %p> %ld,%ld",[self class],self,(long)self.age];
//    
//}
//- (void)run;{
////     NSLog(@"%@  person  run ",[self class]);
//}
- (void)setName:(NSString *)name{
    _name = [name copy];
     NSLog(@"person %@",@"应该会走这个setter方法吧");
}
- (NSString *)name{
    return _name;
}
- (void)dealloc{
     NSLog(@"%@ 已经dealloc",_name);
}
- (id)copyWithZone:(NSZone *)zone{

    Person *p = [[[self class] allocWithZone:zone] init];
    p.name = self.name;
    p.age = self.age;
    return p;
}
- (void)run{
     NSLog(@"%@",@"Person run!");
}
@end
