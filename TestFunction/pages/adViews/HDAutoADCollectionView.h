//
//  HDAutoADCollectionView.h
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HDAutoADCollectionViewPagesProtocal<NSObject>
-(void)currentDisplayPageNumber:(NSInteger)pageNumber;
@end
NS_ASSUME_NONNULL_BEGIN

@interface HDAutoADCollectionView : UICollectionView
@property (nonatomic ,weak) id<HDAutoADCollectionViewPagesProtocal> pageDelegate;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end

NS_ASSUME_NONNULL_END
