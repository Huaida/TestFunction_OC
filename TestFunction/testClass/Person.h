//
//  Person.h
//  TestFunction
//
//  Created by 怀达 on 2018/12/15.
//  Copyright © 2018年 white. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject<NSCopying>
//{
//    NSString *name;
//}
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic, strong) UIButton *btn;

//@synthesize NSString *name = _name;
- (void)run;
@end
