

#import <UIKit/UIKit.h>
#import "RZRichTextProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MacadamizePrimaryParagraphView : UIView <RZRTViewDelegate>
@property (nonatomic, strong) NSMutableParagraphStyle *signatureParagraph;
@property (nonatomic, copy) void(^aachenParagraph)(NSMutableParagraphStyle *signatureParagraph);

@end

NS_ASSUME_NONNULL_END
