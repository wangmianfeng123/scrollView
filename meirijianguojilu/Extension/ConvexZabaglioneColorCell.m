

#import "ConvexZabaglioneColorCell.h"
#import <Masonry/Masonry.h>

@implementation ConvexZabaglioneColorCell
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView).offset(-2);
            make.width.height.equalTo(@20);
        }];
    }
    return _imageView;
}

- (UIImageView *)yachtswomanView {
    if (!_yachtswomanView) {
        _yachtswomanView = [[UIImageView alloc] init];
        [self.contentView addSubview:_yachtswomanView];
        _yachtswomanView.layer.cornerRadius = 2;
        _yachtswomanView.layer.masksToBounds = YES;
        [_yachtswomanView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.imageView.mas_bottom);
            make.width.equalTo(@20);
            make.height.equalTo(@4);
        }];
    }
    return _yachtswomanView;
}
@end
