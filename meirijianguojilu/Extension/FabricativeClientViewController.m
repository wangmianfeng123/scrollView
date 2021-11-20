

#import "FabricativeClientViewController.h"
#import <Masonry/Masonry.h>
#import "NabeAttributeConfigureManager.h"
#import "LinkerImeSliderView.h"
#import "TransactionBitmapColorView.h"
#import "UIView+ExsilentioSetterFrame.h"
#import "MacadamizePrimaryParagraphView.h"
#import "RZRichTextProtocol.h"
#import "RangeScrollShadowView.h"
#import "AttributeFirewallView.h"

@interface FabricativeClientViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL dismiss;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *vaccineView;


@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, strong) UIButton *mabelBtn;

@property (nonatomic, strong) NSMutableArray *viewsDataSource;

@property (nonatomic, strong) LinkerImeSliderView *macaberSlider;
@property (nonatomic, assign) CGFloat qeaValue;
@property (nonatomic, assign) CGFloat pacaValue;
@property (nonatomic, assign) CGFloat zadarValue;
@property (nonatomic, copy) void(^onlineChanged)(CGFloat value);
@property (nonatomic, copy) void(^lvalueComplete)(CGFloat value);

@property (nonatomic, strong) TransactionBitmapColorView *overrideView;
@property (nonatomic, copy) void(^flushChanged)(UIColor *color);
@property (nonatomic, copy) void(^deductionComplete)(UIColor *color);
@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) MacadamizePrimaryParagraphView *kadiView;
@property (nonatomic, copy) void(^decisionChanged)(NSMutableParagraphStyle *signatureParagraph);
@property (nonatomic, copy) void(^managedComplete)(NSMutableParagraphStyle *signatureParagraph);
@property (nonatomic, strong) NSMutableParagraphStyle *signatureParagraph;

@property (nonatomic, strong) RangeScrollShadowView *shadowView;
@property (nonatomic, copy) void(^advancedChanged)(NSShadow *shadow);
@property (nonatomic, copy) void(^unaryComplete)(NSShadow *shadow);
@property (nonatomic, strong) NSShadow *shadow;

@property (nonatomic, strong) AttributeFirewallView *vowelView;
@property (nonatomic, copy) void(^jabiruComplete)(NSAttributedString *foreignString);
@property (nonatomic, strong) NSAttributedString *foreignString;

@property (nonatomic, assign) CGFloat tableViewHeight;

@end

@implementation FabricativeClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    self.vaccineView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.vaccineView.x = self.view.frame.size.width;
    [self.view addSubview:self.vaccineView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.vaccineView addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.layer.masksToBounds = NO;
    
    _viewsDataSource = @[].mutableCopy;
    if (self.onlineChanged) {
        [_viewsDataSource addObject:self.macaberSlider];
    }
    if (self.flushChanged) {
        [_viewsDataSource addObject:self.overrideView];
    }
    if (self.advancedChanged) {
        [_viewsDataSource addObject:self.shadowView];
    }
    if (self.decisionChanged) {
        [_viewsDataSource addObject:self.kadiView];
    }
    
    if (self.jabiruComplete) {
        [_viewsDataSource addObject:self.vowelView];
    }
    
    __block CGFloat height = 150;
    [_viewsDataSource enumerateObjectsUsingBlock:^(UIView <RZRTViewDelegate> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        height += obj.viewHeight;
    }];
    self.tableViewHeight = height;
    
    [self setTableViewHeight];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceChangeOrientation:) name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)deviceChangeOrientation:(id)sender {
    CGRect frame = self.vaccineView.frame;
    frame.size = self.view.size;
    self.vaccineView.frame = frame;
    
    [self setTableViewHeight];
}

- (void)setTableViewHeight {
    CGFloat height = self.tableViewHeight;
    if (height > self.view.frame.size.height - (rz_iPhone_liuhai? 74:0)) {
        height = self.view.frame.size.height - (rz_iPhone_liuhai? 74:0);
    }
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.vaccineView);
        make.width.equalTo(self.vaccineView).offset(-20);
        make.height.equalTo(@(height));
    }];
}

- (void)zadarValue:(CGFloat)value min:(CGFloat)min max:(CGFloat)max didSliderValueChanged:(void (^)(CGFloat))changed complete:(nonnull void (^)(CGFloat))complete {
    self.zadarValue = value;
    self.qeaValue = min;
    self.pacaValue = max;
    self.onlineChanged = changed;
    self.lvalueComplete = complete;
}

- (void)color:(UIColor *)color didChanged:(void(^)(UIColor *color))coloChanged complete:(void(^)(UIColor *color))complete {
    self.flushChanged = coloChanged;
    self.deductionComplete = complete;
    self.color = color;
}

- (void)pargraph:(NSMutableParagraphStyle *)signatureParagraph didChanged:(void(^)(NSMutableParagraphStyle *signatureParagraph))paragraphChanged complete:(void(^)(NSMutableParagraphStyle *signatureParagraph))complete {
    self.signatureParagraph = signatureParagraph;
    self.decisionChanged = paragraphChanged;
    self.managedComplete = complete;
}

- (void)shadow:(NSShadow *)shadow didChanged:(void (^)(NSShadow * _Nonnull))shadowChanged complete:(void (^)(NSShadow * _Nonnull))complete {
    self.shadow = shadow;
    self.advancedChanged = shadowChanged;
    self.unaryComplete = complete;
}

- (void)foreignString:(NSAttributedString *)foreignString didEditComplete:(void(^)(NSAttributedString *foreignString))complete {
    self.foreignString = foreignString;
    self.jabiruComplete = complete;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.vaccineView.x = 0;
    } completion:^(BOOL finished) {
        self.tableView.scrollEnabled = self.tableView.contentSize.height > self.tableView.frame.size.height ? YES:NO;
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (!self.dismiss) {
        return ;
    }
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.vaccineView.y = self.view.frame.size.height;
        self.view.alpha = 0.4;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)cancelBtnClicked:(UIButton *)sender {
    self.dismiss = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)comfirmBtnClicked:(UIButton *)sender {
    if (self.lvalueComplete) {
        self.lvalueComplete(_macaberSlider.macaberSlider.value);
    }
    if (self.deductionComplete) {
        self.deductionComplete(_overrideView.color);
    }
    if (self.managedComplete) {
        self.managedComplete(_kadiView.signatureParagraph);
    }
    if (self.unaryComplete) {
        self.unaryComplete(_shadowView.shadow);
    }
    if (self.jabiruComplete) {
        self.jabiruComplete(_vowelView.foreignString);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewsDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView<RZRTViewDelegate> *obj = self.viewsDataSource[indexPath.row];
    return [obj viewHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *idf = [NSString stringWithFormat:@"cell%@", @(indexPath.row)];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idf];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idf];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.viewsDataSource[indexPath.row]];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_jabiruLabel) {
        return 55;
    }
    if (_textView) {
        return 100;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.topView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.bottomView;
}


- (UILabel *)jabiruLabel {
    if (!_jabiruLabel) {
        _jabiruLabel = [[UILabel alloc] init];
        _jabiruLabel.textAlignment = NSTextAlignmentCenter;
        _jabiruLabel.backgroundColor = [UIColor whiteColor];
        _jabiruLabel.font = [UIFont systemFontOfSize:20];
    }
    return _jabiruLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        _textView.editable = NO;
        _textView.scrollEnabled = NO;
        _textView.textContainerInset = UIEdgeInsetsZero;
    }
    return _textView;
}

- (UIView *)topView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    if (_jabiruLabel) {
        [view addSubview:self.jabiruLabel];
        [self.jabiruLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view).offset(-15);
            make.centerX.equalTo(view);
            make.width.mas_lessThanOrEqualTo(view);
        }];
    }
    if (_textView) {
        [view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(view);
            make.centerX.equalTo(view);
            make.width.equalTo(view);
            make.height.equalTo(@(100));
        }];
        view.height = 100;
    }
 
    view.layer.masksToBounds = NO;
    return view;
}

- (UIView *)bottomView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];

    self.addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:self.addressBtn];
    [self.addressBtn setBackgroundImage:k_zouxiangni_richImage(@"labarum_btn") forState:UIControlStateNormal];
    [self.addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.top.equalTo(view).offset(10);
        make.width.height.equalTo(@80);
        make.bottom.equalTo(view).offset(-10);
    }];
    [self.addressBtn addTarget:self action:@selector(comfirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.mabelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:self.mabelBtn];
    [self.mabelBtn setImage:k_zouxiangni_richImage(@"henjiuzhiqian") forState:UIControlStateNormal];
    [self.mabelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressBtn);
        make.right.equalTo(self.addressBtn.mas_left).offset(-40);
        make.width.height.equalTo(@50);
    }];
    [self.mabelBtn addTarget:self action:@selector(cancelBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    return view;
}


- (LinkerImeSliderView *)macaberSlider {
    if (!_macaberSlider) {
        _macaberSlider = [[LinkerImeSliderView alloc] init];
        _macaberSlider.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, _macaberSlider.viewHeight);
        _macaberSlider.backgroundColor = [UIColor whiteColor];
        _macaberSlider.macaberSlider.minimumValue = self.qeaValue;
        _macaberSlider.macaberSlider.maximumValue = self.pacaValue;
        _macaberSlider.macaberSlider.value = self.zadarValue;
        rz_weakObj(self);
        _macaberSlider.finalizationChanged = ^(CGFloat value) {
            selfWeak.zadarValue = value;
            if (selfWeak.onlineChanged) {
                selfWeak.onlineChanged(value);
            }
        };
    }
    return _macaberSlider;
}

- (TransactionBitmapColorView *)overrideView {
    if (!_overrideView) {
        _overrideView = [[TransactionBitmapColorView alloc] init];
        _overrideView.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, _overrideView.viewHeight);
        _overrideView.color = self.color;
        rz_weakObj(self);
        _overrideView.macadamColor = ^(UIColor * _Nonnull color) {
            selfWeak.color = color;
            if (selfWeak.flushChanged) {
                selfWeak.flushChanged(color);
            }
        };
    }
    return _overrideView;
}

- (MacadamizePrimaryParagraphView *)kadiView {
    if (!_kadiView) {
        _kadiView = [[MacadamizePrimaryParagraphView alloc] init];
        _kadiView.signatureParagraph = self.signatureParagraph;
        _kadiView.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, _kadiView.viewHeight);
        rz_weakObj(self);
        _kadiView.aachenParagraph = ^(NSMutableParagraphStyle * _Nonnull signatureParagraph) {
            selfWeak.signatureParagraph = signatureParagraph;
            if (selfWeak.decisionChanged) {
                selfWeak.decisionChanged(signatureParagraph);
            }
        };
    }
    return _kadiView;
}

- (RangeScrollShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[RangeScrollShadowView alloc] init];
        _shadowView.shadow = self.shadow;
        _shadowView.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, _shadowView.viewHeight);
        rz_weakObj(self);
        _shadowView.fabledShadow = ^(NSShadow * _Nonnull shadow) {
            selfWeak.shadow = shadow;
            if (selfWeak.advancedChanged) {
                selfWeak.advancedChanged(shadow);
            }
        };
    }
    return _shadowView;
}

- (AttributeFirewallView *)vowelView {
    if (!_vowelView) {
        _vowelView = [[AttributeFirewallView alloc] init];
        _vowelView.foreignString = self.foreignString;
        _vowelView.frame = CGRectMake(0, 0, self.view.frame.size.width - 20, _vowelView.viewHeight);
        rz_weakObj(self);
        _vowelView.nabeComplete = ^(NSAttributedString * _Nonnull foreignString) {
            selfWeak.foreignString = foreignString;
        };
    }
    return _vowelView;
}

@end
