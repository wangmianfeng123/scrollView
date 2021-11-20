

#import "LinkerImeSliderView.h"
#import <Masonry/Masonry.h>
#import "NabeAttributeConfigureManager.h"

@implementation LinkerImeSliderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        self.macaberSlider = [[UISlider alloc] init];
        [self addSubview:self.macaberSlider];
        [self.macaberSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        self.minLabel = [[UILabel alloc] init];
        [self addSubview:self.minLabel];
        
        self.maxLabel = [[UILabel alloc] init];
        [self addSubview:self.maxLabel];
        
        self.minLabel.textAlignment = NSTextAlignmentCenter;
        self.maxLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.minLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(10);
            make.width.equalTo(@40);
        }];
        [self.maxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-10);
            make.width.equalTo(@40);
        }];
        
        [self.macaberSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.minLabel.mas_right).offset(2);
            make.right.equalTo(self.maxLabel.mas_left).offset(-2);
            make.height.equalTo(@30);
        }];
        self.macaberSlider.maximumTrackTintColor = NabeAttributeConfigureManager.manager.clsColor;
        self.macaberSlider.minimumTrackTintColor = NabeAttributeConfigureManager.manager.clsColor;
        [self.macaberSlider setThumbImage:NabeAttributeConfigureManager.manager.nabiImage forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.minLabel.text = [NSString stringWithFormat:@"%@", @(self.macaberSlider.minimumValue)];
    self.maxLabel.text = [NSString stringWithFormat:@"%@", @(self.macaberSlider.maximumValue)];
}

- (void)sliderValueChanged:(UISlider *)sender {
    if (self.finalizationChanged) {
        self.finalizationChanged(sender.value);
    }
}

- (CGFloat)viewHeight {
    return 50;
}

@end
