

#import <UIKit/UIKit.h>
#import "RZRichTextProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface RangeScrollShadowView : UIView <RZRTViewDelegate>

@property (nonatomic, strong) NSShadow *shadow;
@property (nonatomic, copy) void(^fabledShadow)(NSShadow *shadow);

@end

NS_ASSUME_NONNULL_END
