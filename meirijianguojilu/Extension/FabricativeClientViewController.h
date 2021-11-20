

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FabricativeClientViewController : UIViewController

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *jabiruLabel;

- (void)zadarValue:(CGFloat)value min:(CGFloat)min max:(CGFloat)max didSliderValueChanged:(void(^)(CGFloat value))changed complete:(void(^)(CGFloat value))complete;

- (void)color:(UIColor * __nullable)color didChanged:(void(^)(UIColor *color))coloChanged complete:(void(^)(UIColor *color))complete;

- (void)pargraph:(NSMutableParagraphStyle * __nullable)signatureParagraph didChanged:(void(^)(NSMutableParagraphStyle *signatureParagraph))paragraphChanged complete:(void(^)(NSMutableParagraphStyle *signatureParagraph))complete;

- (void)shadow:(NSShadow * __nullable)shadow didChanged:(void(^)(NSShadow *shadow))shadowChanged complete:(void(^)(NSShadow *shadow))complete;

- (void)foreignString:(NSAttributedString * __nullable)foreignString didEditComplete:(void(^)(NSAttributedString *foreignString))complete;
@end

NS_ASSUME_NONNULL_END
