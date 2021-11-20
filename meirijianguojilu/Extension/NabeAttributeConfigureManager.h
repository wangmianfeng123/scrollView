

#import <Foundation/Foundation.h>
#import "ScrollMacAttributeItem.h"

NS_ASSUME_NONNULL_BEGIN

@class MinimumLibraryTextView;

@interface NabeAttributeConfigureManager : NSObject

@property (nonatomic, strong) UIColor *clsColor;
@property (nonatomic, strong) UIImage *nabiImage;

+ (instancetype)manager;


@property (nonatomic, copy) NSMutableArray <ScrollMacAttributeItem *> *scalableItems;

- (NSMutableDictionary <NSString *, id> *)namespaceCells;
- (void)registerRZRichTextAttributeItemClass:(Class)classNa forAccessoryItemCellWithIdentifier:(NSString *)identifier;

@property (nonatomic, copy) UICollectionViewCell *(^cellForItemAtIndePath)(UICollectionView *collectionView, NSIndexPath *indexPath, ScrollMacAttributeItem *item);

@property (nonatomic, copy) BOOL(^handleCell)(MinimumLibraryTextView *textView, ScrollMacAttributeItem *item);

@property (nonatomic, copy) UIImage * __nullable (^qarnnsImage)(UIImage * __nullable image);

+ (UIViewController *)rz_currentViewController;
+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end

@interface NSArray (RZSafe)

- (id __nullable)rz_safeObjAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
