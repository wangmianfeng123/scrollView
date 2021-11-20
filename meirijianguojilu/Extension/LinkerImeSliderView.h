

#import <UIKit/UIKit.h>
#import "RZRichTextProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkerImeSliderView : UIView <RZRTViewDelegate>

@property (nonatomic, strong) UISlider *macaberSlider;
@property (nonatomic, strong) UILabel *minLabel;
@property (nonatomic, strong) UILabel *maxLabel;

@property (nonatomic, copy) void(^finalizationChanged)(CGFloat value);
@end

NS_ASSUME_NONNULL_END
