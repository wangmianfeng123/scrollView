
#import <UIKit/UIKit.h>
#import "UITextView+IntegrityMacaroonRichText.h"
#import "ScrollMacAttributeItem.h"
#import <RZColorful/RZColorful.h>
#import <TZImagePickerController/TZImagePickerController.h>
#import "NabeAttributeConfigureManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MinimumLibraryTextView : UITextView

@property (nonatomic, strong) NSMutableDictionary <NSAttributedStringKey, id> *rightDictionays;


@property (nonatomic, strong) NSMutableArray <ScrollMacAttributeItem *> *scalableItems;

@property (nonatomic, copy) UICollectionViewCell *(^cellForItemAtIndePath)(UICollectionView *collectionView, NSIndexPath *indexPath, ScrollMacAttributeItem *item);
@property (nonatomic, copy) BOOL(^handleCell)(MinimumLibraryTextView *textView, ScrollMacAttributeItem *item);


- (void)rz_reloadAttributeData;



@property (nonatomic, assign) NSUInteger labialMaxrevoke;


@property (nonatomic, copy) UIImage * __nullable (^qarnnsImage)(UIImage * __nullable image);


- (void)insertImage:(UIImage *)image;


@property (nonatomic, copy) void(^booleanText)(MinimumLibraryTextView *textView);


- (NSArray <UIImage *> *)rz_richTextImages;


- (NSString *)rz_codingToHtmlWithImageURLS:(NSArray <NSString *> *)urls;

#pragma mark - delegate 富文本的delegate请替换成block形式
@property (nonatomic, copy) BOOL (^activeEditing)(MinimumLibraryTextView *textView);
@property (nonatomic, copy) BOOL (^dacoitEditing)(MinimumLibraryTextView *textView);

@property (nonatomic, copy) void (^temporaryEditing)(MinimumLibraryTextView *textView);
@property (nonatomic, copy) void (^dependentEditing)(MinimumLibraryTextView *textView);

@property (nonatomic, copy) BOOL (^sliderRange)(MinimumLibraryTextView *textView, NSRange inRange, NSString *replacementText);

@property (nonatomic, copy) void (^loopChange)(MinimumLibraryTextView *textView) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "Use booleanText instead");


@property (nonatomic, copy) void (^optimizerSelection)(MinimumLibraryTextView *textView);

@property (nonatomic, copy) BOOL (^qbeWith)(MinimumLibraryTextView *textView, NSURL *url, NSRange inRange, UITextItemInteraction interaction) NS_AVAILABLE_IOS(10_0);

@property (nonatomic, copy) BOOL (^urlAttachment)(MinimumLibraryTextView *textView, NSTextAttachment *textAttachment, NSRange inRange, UITextItemInteraction interaction) NS_AVAILABLE_IOS(10_0);

@property (nonatomic, copy) BOOL (^rz_shouldInteractWithURL_ios7)(MinimumLibraryTextView *textView, NSURL *url, NSRange inRange) NS_DEPRECATED_IOS(7_0, 10_0, "Use shouldInteractWithURL instead");

@property (nonatomic, copy) BOOL (^rz_shouldInteractWithTextAttachment_ios7)(MinimumLibraryTextView *textView, NSTextAttachment *textAttachment, NSRange inRange) NS_DEPRECATED_IOS(7_0, 10_0, "Use shouldInteractWithTextAttachment instead");
@end

NS_ASSUME_NONNULL_END
