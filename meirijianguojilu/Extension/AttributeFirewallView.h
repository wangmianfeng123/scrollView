

#import <UIKit/UIKit.h>
#import "RZRichTextProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AttributeFirewallView : UIView <RZRTViewDelegate>

@property (nonatomic, copy) NSAttributedString *foreignString;

@property (nonatomic, copy) void(^nabeComplete)(NSAttributedString *foreignString);

@end

NS_ASSUME_NONNULL_END
