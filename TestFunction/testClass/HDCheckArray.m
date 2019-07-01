//
//  HDCheckArray.m
//  TestFunction
//
//  Created by 怀达 on 2019/4/12.
//  Copyright © 2019 white. All rights reserved.
//

#import "HDCheckArray.h"

@implementation HDCheckArray


- (NSMutableArray *)checkArrayInMutableArray:(NSMutableArray *)mArray{
    if (mArray == nil) {
        return nil;
    }
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:mArray.count];
    NSUInteger arrayCount = mArray.count;
    for (int i =0 ; i < arrayCount; i ++) {
        [tempArray addObject:[NSNumber numberWithInt:i]];
        long long tag = [mArray[i] longLongValue];
        
        for(int j = i+1;j < arrayCount;j ++){
            //        把下标加到数组中
            if (tag == [mArray[j] longLongValue]) {
                [tempArray insertObject:[NSNumber numberWithInt:j] atIndex:0];
                
            }
            
        }
        if (tempArray.count >1) {
//            删去下标所有值  更新数组长度
            
            for (NSNumber *sub in tempArray) {
                
                [mArray removeObjectAtIndex:[sub integerValue]];
            }
            arrayCount = arrayCount - tempArray.count;
            i--;
        }
        [tempArray removeAllObjects];
    }
    
    
    return mArray;
}


@end
