

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HDRedEnvelopeDataViewProtocol <NSObject>

- (void)redEnvelopeDataViewSubmit:(NSString *)monenyString :(NSString *)countString;

@end

@interface HDRedEnvelopeDataView : UIView
@property (nonatomic ,weak) id<HDRedEnvelopeDataViewProtocol> delegate;
@property (nonatomic ,strong,readonly) UITextField * luckyNoteTextField;  // 祝福语占位图  最多15个字
@property (nonatomic,assign) CGFloat submitButtonYvalue;
@end

NS_ASSUME_NONNULL_END
