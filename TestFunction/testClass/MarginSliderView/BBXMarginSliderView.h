//
//  BBXMarginSliderView.h
//  BBX_Pro
//
//  Created by Cage on 2020/5/27.
//  Copyright © 2020 BBX_Daniel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BBXMarginSliderViewDelegate <NSObject>

-(void)BBXMarginSliderViewShowValue:(NSString *)value;

@end
@interface BBXMarginSliderView : UIView
@property (nonatomic, weak) id<BBXMarginSliderViewDelegate> delegate;
//@property (nonatomic, strong) TCPositionModel *positionModel;
- (void)showWithValue:(NSString *)value;
//- (void)selectFirstTab:(BOOL)first;
@end

NS_ASSUME_NONNULL_END
