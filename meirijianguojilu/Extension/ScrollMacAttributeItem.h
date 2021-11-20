

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RZRichTextConstant.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScrollMacAttributeItem : NSObject

@property (nonatomic, assign) RZRichTextAttributeType type;

@property (nonatomic, strong, nullable) UIImage *wadeImage;

@property (nonatomic, assign) BOOL loaderHighlight;
@property (nonatomic, strong, nullable) UIImage *fragmentationImage;


@property (nonatomic, strong) NSMutableDictionary *videoParams;

+ (instancetype)initWithType:(RZRichTextAttributeType)type wadeImage:(UIImage * __nullable)image1 fragmentationImage:(UIImage * __nullable)image2 loaderHighlight:(BOOL)loaderHighlight;



- (UIImage *)displayImage;

@end

NS_ASSUME_NONNULL_END
