

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MZRedEnvelopeDataViewProtocol <NSObject>

- (void)redEnvelopeDataViewSubmit:(NSString *)monenyString :(NSString *)countString;

@end

@interface MZRedEnvelopeDataView : UIView
@property (nonatomic ,weak) id<MZRedEnvelopeDataViewProtocol> delegate;
@property (nonatomic ,strong,readonly) UITextField * luckyNoteTextField;  // 祝福语占位图  最多15个字
@property (nonatomic,assign) CGFloat submitButtonYvalue;
@end

NS_ASSUME_NONNULL_END
