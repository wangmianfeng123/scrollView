

#import <UIKit/UIKit.h>
#import "ScrollMacAttributeItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface tongrentangFinalizerAccessoryView : UIView

- (void)reloadData;

@property (nonatomic, copy) NSMutableArray <ScrollMacAttributeItem *> *scalableItems;

@property (nonatomic, copy) UICollectionViewCell *(^cellForItemAtIndePath)(UICollectionView *collectionView, NSIndexPath *indexPath, ScrollMacAttributeItem *item);

@property (nonatomic, copy) void(^openIndex)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
