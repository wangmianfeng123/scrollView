

#import <UIKit/UIKit.h>
#import "RZRichTextProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionBitmapColorView : UIView <RZRTViewDelegate>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, copy) void(^macadamColor)(UIColor *color);

@end

NS_ASSUME_NONNULL_END
