

#import "ClipboardBabassuInputCell.h"
#import <Masonry/Masonry.h>

@implementation ClipboardBabassuInputCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.width.height.equalTo(@28);
        }];
    }
    return _imageView;
}

@end
