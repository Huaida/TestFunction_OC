//
//  Person.m
//  TestFunction
//
//  Created by 怀达 on 2018/12/15.
//  Copyright © 2018年 white. All rights reserved.
// 1 2


#import "Person.h"

@implementation SubClass1
+ (BOOL)supportsSecureCoding{
    return YES;
}
-(void)encodeWithCoder:(NSCoder *)encoder{
//    [self modelEncodeWithCoder:encoder];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeInt:self.age forKey:@"age"];
    
}
 
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
//    解档总是失败 decodeObjectForKey 需要替换为 decodeObjectOfClass
//    pod 库修改后 不好更新同步 暂时不做替换
//    return [self modelInitWithCoder:aDecoder];
    self.name = [aDecoder decodeObjectOfClass:NSString.class forKey:@"name"];
    self.age = [aDecoder decodeIntForKey:@"age"];
    
    return self;
}
- (NSString *)description { return [self modelDescription]; }


@end

@implementation Person

@synthesize name = _name;
- (instancetype)init{
    if (self = [super init]) {
        _name = @"init name";
//        _btn = [[UIButton alloc] init];
//        [_btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
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

+ (BOOL)supportsSecureCoding{
    return YES;
}
-(void)encodeWithCoder:(NSCoder *)encoder{
//    [self modelEncodeWithCoder:encoder];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.sub forKey:@"sub"];
    [encoder encodeInt:self.age forKey:@"age"];
}
 
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
//    解档总是失败 decodeObjectForKey 需要替换为 decodeObjectOfClass
//    pod 库修改后 不好更新同步 暂时不做替换
//    return [self modelInitWithCoder:aDecoder];
    self.name = [aDecoder decodeObjectOfClass:NSString.class forKey:@"name"];
//    self.age = [aDecoder decodeObjectOfClass:NSInteger.Class forKey:@"age"];
    self.age = [aDecoder decodeIntForKey:@"age"];
    self.sub = [aDecoder decodeObjectOfClass:SubClass1.class forKey:@"sub"];
    return self;
}
- (NSString *)description { return [self modelDescription]; }
@end
