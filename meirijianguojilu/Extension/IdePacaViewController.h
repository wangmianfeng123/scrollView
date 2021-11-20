

#import <UIKit/UIKit.h>
#import "RZRichTextConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface IdePacaViewController : UIViewController

- (instancetype)init NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "Please use the initWithType: method to initialize");

- (instancetype)initWithType:(RZRichAlertViewType)type;

- (instancetype)initWithType:(RZRichAlertViewType)type title:(NSString * __nullable)title;


@property (nonatomic, strong) NSArray <NSDictionary *> *partTitles;

@property (nonatomic, assign) BOOL showCancelButton;


@property (nonatomic, copy) void(^associativeSelected)(NSUInteger index, BOOL isCancel);

@property (nonatomic, assign) NSInteger fraterniteIndex;
@property (nonatomic, strong) UIColor *mabelaColor;
@property (nonatomic, copy) NSString *xanthinString;

- (void)show;

@end

NS_ASSUME_NONNULL_END
