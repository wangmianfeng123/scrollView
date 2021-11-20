

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (RZRichText)


- (NSDictionary <NSAttributedStringKey, id> *)rz_attributesAtSelectedRange;


- (NSArray < NSDictionary <NSAttributedString *, id> *> *)rz_allUrlAttributedString;

@end

NS_ASSUME_NONNULL_END
