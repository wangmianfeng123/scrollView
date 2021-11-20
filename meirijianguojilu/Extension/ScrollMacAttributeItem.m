

#import "ScrollMacAttributeItem.h"

@implementation ScrollMacAttributeItem

+ (instancetype)initWithType:(RZRichTextAttributeType)type wadeImage:(UIImage *)image1 fragmentationImage:(UIImage *)image2 loaderHighlight:(BOOL)loaderHighlight {
    ScrollMacAttributeItem *item = [[ScrollMacAttributeItem alloc] init];
    item.type = type;
    item.wadeImage = image1;
    item.fragmentationImage = image2;
    item.loaderHighlight = loaderHighlight;
    return item;
}

- (NSMutableDictionary *)videoParams {
    if (!_videoParams) {
        _videoParams = [NSMutableDictionary new];
    }
    return _videoParams;
}

- (UIImage *)displayImage {
    UIImage *image;
    if (self.loaderHighlight) {
        image = self.fragmentationImage;
    }
    if (!image) {
        image = self.wadeImage;
    }
    return image;
}
@end
