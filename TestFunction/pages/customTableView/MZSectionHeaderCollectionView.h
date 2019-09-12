//
//  MZSectionHeaderCollectionView.h
//  TestFunction
//
//  Created by 怀达 on 2019/9/9.
//  Copyright © 2019 white. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MZSectionHeaderCollectionViewProtocol <NSObject>

-(void)sectionHeaderCollectionViewDidSelectedIndex:(NSIndexPath *)index;

@end

@interface MZSectionHeaderCollectionView : UICollectionView
@property (nonatomic ,weak) id<MZSectionHeaderCollectionViewProtocol> sectionHeaderDelegate;
+ (instancetype)sectionHeaderFromData:(NSArray *)data;
@end

NS_ASSUME_NONNULL_END
