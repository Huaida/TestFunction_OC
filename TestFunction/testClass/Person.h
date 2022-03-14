//
//  Person.h
//  TestFunction
//
//  Created by 怀达 on 2018/12/15.
//  Copyright © 2018年 white. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SubClass1 : NSObject<NSSecureCoding>
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;

@end

@interface Person : NSObject<NSCopying,NSCoding,NSSecureCoding>
//{
//    NSString *name;
//}
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
//@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) SubClass1 *sub;

//@synthesize NSString *name = _name;
- (void)run;
@end
