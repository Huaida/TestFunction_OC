//
//  HDAutoADCollectionView.h
//  TestFunction
//
//  Created by 怀达 on 2019/8/26.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HDAutoADCollectionViewProtocal<NSObject>
-(void)AutoADCollectionViewcurrentDisplayPageNumber:(NSInteger)pageNumber;
-(void)AutoADCollectionViewSelectedLink:(NSString *_Nullable)link;
-(void)AutoADCollectionViewPauseTimerForDragging;
-(void)AutoADCollectionViewStartTimerForEndDragging;
@end
NS_ASSUME_NONNULL_BEGIN

@interface HDAutoADCollectionView : UICollectionView
@property (nonatomic ,weak) id<HDAutoADCollectionViewProtocal> pageDelegate;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end

NS_ASSUME_NONNULL_END
