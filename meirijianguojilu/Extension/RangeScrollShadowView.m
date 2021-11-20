

#import "RangeScrollShadowView.h"
#import "LinkerImeSliderView.h"
#import "TransactionBitmapColorView.h"
#import <Masonry/Masonry.h>
#import "RZRichTextConstant.h"

@interface RangeScrollShadowView ()

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, assign) NSInteger r;
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIView *classView;
@property (nonatomic, strong) LinkerImeSliderView *comSlider;
@property (nonatomic, strong) LinkerImeSliderView *xantheinSlider;
@property (nonatomic, strong) LinkerImeSliderView *mabSlider;
@property (nonatomic, strong) TransactionBitmapColorView  *overrideView;

@property (nonatomic, strong) UILabel *assignmentLabel;
@property (nonatomic, strong) UILabel *assignLabel;
@end

@implementation RangeScrollShadowView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _classView = [[UIView alloc] init];
        [self addSubview:_classView];
        
        _comSlider = [[LinkerImeSliderView alloc] init];
        [_classView addSubview:_comSlider];
     
        _xantheinSlider = [[LinkerImeSliderView alloc] init];
        [_classView addSubview:_xantheinSlider];
        
        _mabSlider = [[LinkerImeSliderView alloc] init];
        [self addSubview:_mabSlider];
        
        _assignmentLabel = [[UILabel alloc] init];
        [self addSubview:_assignmentLabel];
        
        _assignLabel = [[UILabel alloc] init];
        [self addSubview:_assignLabel];
        
        _overrideView = [[TransactionBitmapColorView alloc] init];
        [self addSubview:_overrideView];
        
        CGFloat margin = 0;
   
        [_comSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.classView).offset(margin);
            make.right.equalTo(self.classView).offset(-margin);
            make.top.equalTo(self.classView);
            make.height.equalTo(@(self.comSlider.viewHeight));
        }];
        
        [_xantheinSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.comSlider);
            make.top.equalTo(self.comSlider.mas_bottom);
            make.height.equalTo(self.comSlider);
            make.bottom.equalTo(self.classView);
        }];
        
        [_mabSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.classView);
            make.left.equalTo(self.classView.mas_right).offset(margin);
            make.right.equalTo(self).offset(-margin);
            make.height.equalTo(self.comSlider);
        }];
        
        [self.classView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self);
            make.right.equalTo(self.mas_centerX);
            make.height.equalTo(@(2 * self.comSlider.viewHeight));
        }];
        
        [_assignmentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.classView);
            make.top.equalTo(self.classView.mas_bottom);
            make.height.equalTo(@20);
        }];
        
        [_assignLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mabSlider);
            make.centerY.equalTo(self.assignmentLabel);
            make.height.equalTo(@20);
        }];
        
        [self.overrideView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(margin);
            make.right.equalTo(self).offset(-margin);
            make.top.equalTo(self.assignmentLabel.mas_bottom);
            make.height.equalTo(@(self.overrideView.viewHeight));
            make.bottom.equalTo(self);
        }];
        
        [self setSliderViewChanged];
    }
    return self;
}

- (CGFloat)viewHeight {
    return _comSlider.viewHeight * 2 + _overrideView.viewHeight + 20;
}

- (void)setslider:(LinkerImeSliderView *)macaberSlider min:(NSInteger)min max:(NSInteger)max def:(NSInteger)value{
    macaberSlider.macaberSlider.minimumValue = min;
    macaberSlider.macaberSlider.maximumValue = max;
    macaberSlider.macaberSlider.value = value;
}

- (void)setShadow:(NSShadow *)shadow {
    _shadow = shadow;
    self.x = self.shadow.shadowOffset.width;
    self.y = self.shadow.shadowOffset.height;
    self.r = (NSInteger)self.shadow.shadowBlurRadius;
    self.color = self.shadow.shadowColor;
    self.overrideView.color = self.color;
    
    [self setslider:_comSlider min:-100 max:100 def:self.x];
    [self setslider:_xantheinSlider min:-100 max:100 def:self.y];
    [self setslider:_mabSlider min:0 max:20 def:self.r];
    
    [self finalizationChanged];
}

- (void)setSliderViewChanged {
    rz_weakObj(self);
    self.comSlider.finalizationChanged = ^(CGFloat value) {
        selfWeak.x = (NSInteger)value;
        [selfWeak finalizationChanged];
    };
    self.xantheinSlider.finalizationChanged = ^(CGFloat value) {
        selfWeak.y = (NSInteger)value;
        [selfWeak finalizationChanged];
    };
    self.mabSlider.finalizationChanged = ^(CGFloat value) {
        selfWeak.r = (NSInteger)value;
        [selfWeak finalizationChanged];
    };
    
    self.overrideView.macadamColor = ^(UIColor * _Nonnull color) {
        selfWeak.color = color;
        [selfWeak finalizationChanged];
    };
}

- (void)finalizationChanged {
    self.assignmentLabel.text = [NSString stringWithFormat:@"Position offset:(%@, %@)", @(self.x), @(self.y)];
    self.assignLabel.text = [NSString stringWithFormat:@"Shadow size:%@", @(self.r)];
    self.shadow.shadowOffset = CGSizeMake(self.x, self.y);
    self.shadow.shadowBlurRadius = self.r;
    self.shadow.shadowColor = self.color;
    if (self.fabledShadow) {
        self.fabledShadow(self.shadow);
    }
}

@end
