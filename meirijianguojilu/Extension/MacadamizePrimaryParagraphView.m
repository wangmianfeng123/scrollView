

#import "MacadamizePrimaryParagraphView.h"
#import "RZRichTextConstant.h"
#import <Masonry/Masonry.h>
#import "NabeAttributeConfigureManager.h"

@interface MacadamizePrimaryParagraphView ()

@property (nonatomic, strong) UIButton *atomicBtn;
@property (nonatomic, strong) UIButton *sabaBtn;
@property (nonatomic, strong) UIButton *ubiquitouslyBtn;


@property (nonatomic, strong) UITextField *Before;
@property (nonatomic, strong) UITextField *finalizerBase;
@property (nonatomic, strong) UITextField *fableEnd;

@property (nonatomic, strong) UITextField *ubiBefore;
@property (nonatomic, strong) UITextField *zafferAdl;
@property (nonatomic, strong) UITextField *aasvogelEnd;
@end

@implementation MacadamizePrimaryParagraphView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *cgView = self.cgView;
        UIView *sjView = self.sjView;
        UIView *jjView = self.jjView;
        
        [self addSubview:cgView];
        [self addSubview:sjView];
        [self addSubview:jjView];
        
        [cgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@94);
        }];
        [sjView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(cgView);
            make.top.equalTo(cgView.mas_bottom);
            make.height.equalTo(@(176));
        }];
        [jjView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(cgView);
            make.top.equalTo(sjView.mas_bottom);
            make.height.equalTo(@(176));
        }];
        
        [self addBottomLine:self.Before];
        [self addBottomLine:self.finalizerBase];
        [self addBottomLine:self.fableEnd];
        
        [self addBottomLine:self.ubiBefore];
        [self addBottomLine:self.zafferAdl];
        [self addBottomLine:self.aasvogelEnd];
        
        [self addNotification];
        [self addAliginBtnsAction];
    }
    return self;
}

- (void)addAliginBtnsAction {
    NSArray <UIButton *> *btns = @[self.atomicBtn, self.sabaBtn, self.ubiquitouslyBtn];
    rz_weakObj(self);
    [btns enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj addTarget:selfWeak action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)addNotification {
    NSArray *textfieds = @[self.Before, self.finalizerBase, self.fableEnd, self.ubiBefore, self.zafferAdl, self.aasvogelEnd];
    
    for (UITextField *textfield in textfieds) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textValueChangeged:) name:UITextFieldTextDidChangeNotification object:textfield];
    }
}

- (void)textValueChangeged:(NSNotification *)notification {
    UITextField *textField = notification.object;
    CGFloat value = [textField.text floatValue]; 
    if ([textField isEqual:self.Before]) {
        self.signatureParagraph.firstLineHeadIndent = value;
    } else if ([textField isEqual:self.finalizerBase]) {
        self.signatureParagraph.headIndent = value;
    } else if ([textField isEqual:self.fableEnd]) {
        self.signatureParagraph.tailIndent = value;
    } else if ([textField isEqual:self.ubiBefore]) {
        self.signatureParagraph.paragraphSpacingBefore = value;
    } else if ([textField isEqual:self.zafferAdl]) {
        self.signatureParagraph.lineSpacing = value;
    } else if ([textField isEqual:self.aasvogelEnd]) {
        self.signatureParagraph.paragraphSpacing = value;
    }
    if (self.aachenParagraph) {
        self.aachenParagraph(self.signatureParagraph);
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setSignatureParagraph:(NSMutableParagraphStyle *)signatureParagraph {
    _signatureParagraph = signatureParagraph;
    [self aliginBtnsHighlight:self.signatureParagraph.alignment]; 
    [self paragraphAttri];
}

- (void)btnAction:(UIButton *)sender {
    [self aliginBtnsHighlight:sender.tag];
    self.signatureParagraph.alignment = sender.tag;
    if (self.aachenParagraph) {
        self.aachenParagraph(self.signatureParagraph);
    }
}

- (void)aliginBtnsHighlight:(NSInteger)tagindex {
    NSArray <UIButton *> *btns = @[self.atomicBtn, self.sabaBtn, self.ubiquitouslyBtn];
    [btns enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == tagindex) {
            obj.layer.borderColor = NabeAttributeConfigureManager.manager.clsColor.CGColor;
            obj.layer.borderWidth = 1;
        } else {
            obj.layer.borderWidth = 0;
        }
    }];
}

- (void)paragraphAttri {
    self.Before.text = [NSString stringWithFormat:@"%@", @(self.signatureParagraph.firstLineHeadIndent)];
    self.finalizerBase.text = [NSString stringWithFormat:@"%@", @(self.signatureParagraph.headIndent)];
    self.fableEnd.text = [NSString stringWithFormat:@"%@", @(self.signatureParagraph.tailIndent)];

    self.ubiBefore.text = [NSString stringWithFormat:@"%@", @(self.signatureParagraph.paragraphSpacingBefore)];
    self.zafferAdl.text = [NSString stringWithFormat:@"%@", @(self.signatureParagraph.lineSpacing)];
    self.aasvogelEnd.text = [NSString stringWithFormat:@"%@", @(self.signatureParagraph.paragraphSpacing)];
}



- (UIView *)cgView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rz_k_screen_width, 94)];
    UILabel *label = [[UILabel alloc] init];
    [view addSubview:label];
    label.text = @"conventional";
    label.font = [UIFont systemFontOfSize:15];
    
    self.atomicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.atomicBtn setImage:k_zouxiangni_richImage(@"tiankongguiniaocoote_left") forState:UIControlStateNormal];
    self.atomicBtn.tag = NSTextAlignmentLeft;
    
    self.sabaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sabaBtn setImage:k_zouxiangni_richImage(@"sabbatism_center") forState:UIControlStateNormal];
    self.sabaBtn.tag = NSTextAlignmentCenter;
    
    self.ubiquitouslyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.ubiquitouslyBtn setImage:k_zouxiangni_richImage(@"bug_zouxiangni") forState:UIControlStateNormal];
    self.ubiquitouslyBtn.tag = NSTextAlignmentRight;
    
    [view addSubview:self.atomicBtn];
    [view addSubview:self.sabaBtn];
    [view addSubview:self.ubiquitouslyBtn];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(10);
        make.height.equalTo(@44);
    }];
    
    [self.atomicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label).offset(10);
        make.width.height.equalTo(@44);
        make.top.equalTo(label.mas_bottom);
    }];
    
    [self.sabaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.equalTo(self.atomicBtn);
        make.left.equalTo(self.atomicBtn.mas_right).offset(30);
    }];
    
    [self.ubiquitouslyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.equalTo(self.atomicBtn);
        make.left.equalTo(self.sabaBtn.mas_right).offset(30);
    }];
    return view;
}

- (UIView *)sjView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rz_k_screen_width, 176)];
    UILabel *label = [[UILabel alloc] init];
    [view addSubview:label];
    label.text = @"indentation";
    label.font = [UIFont systemFontOfSize:15];
    
    UILabel *label1 = [[UILabel alloc] init];
    [view addSubview:label1];
    label1.text = @"First line of text:";
    label1.font = [UIFont systemFontOfSize:15];
    self.Before = [[UITextField alloc] init];
    self.Before.keyboardType = UIKeyboardTypeNumberPad;
    
    UILabel *label2 = [[UILabel alloc] init];
    [view addSubview:label2];
    label2.text = @"Text indentation:";
    label2.font = [UIFont systemFontOfSize:15];
    self.finalizerBase = [[UITextField alloc] init];
    self.finalizerBase.keyboardType = UIKeyboardTypeNumberPad;
    
    UILabel *label3 = [[UILabel alloc] init];
    [view addSubview:label3];
    label3.text = @"After the text:";
    label3.font = [UIFont systemFontOfSize:15];
    self.fableEnd = [[UITextField alloc] init];
    self.fableEnd.keyboardType = UIKeyboardTypeNumberPad;
    
    [view addSubview:self.Before];
    [view addSubview:self.finalizerBase];
    [view addSubview:self.fableEnd];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(10);
        make.height.equalTo(@44);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label).offset(10);
        make.height.equalTo(@44);
        make.width.equalTo(@80);
        make.top.equalTo(label.mas_bottom);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1);
        make.width.height.equalTo(label1);
        make.top.equalTo(label1.mas_bottom);
    }];
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1);
        make.width.height.equalTo(label1);
        make.top.equalTo(label2.mas_bottom);
    }];
    
    [self.Before mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
        make.centerY.equalTo(label1);
    }];
    
    [self.finalizerBase mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.width.equalTo(self.Before);
        make.centerY.equalTo(label2);
    }];
    
    [self.fableEnd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.width.equalTo(self.Before);
        make.centerY.equalTo(label3);
    }];
    return view;
}


- (UIView *)jjView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rz_k_screen_width, 176)];
    UILabel *label = [[UILabel alloc] init];
    [view addSubview:label];
    label.text = @"Spacing";
    label.font = [UIFont systemFontOfSize:15];
    
    UILabel *label1 = [[UILabel alloc] init];
    [view addSubview:label1];
    label1.text = @"Segment front distance:";
    label1.font = [UIFont systemFontOfSize:15];
    self.ubiBefore = [[UITextField alloc] init];
    self.ubiBefore.keyboardType = UIKeyboardTypeNumberPad;
    
    UILabel *label2 = [[UILabel alloc] init];
    [view addSubview:label2];
    label2.text = @"Segment spacing:";
    label2.font = [UIFont systemFontOfSize:15];
    self.zafferAdl = [[UITextField alloc] init];
    self.zafferAdl.keyboardType = UIKeyboardTypeNumberPad;
    
    UILabel *label3 = [[UILabel alloc] init];
    [view addSubview:label3];
    label3.text = @"Post-segment distance:";
    label3.font = [UIFont systemFontOfSize:15];
    self.aasvogelEnd = [[UITextField alloc] init];
    self.aasvogelEnd.keyboardType = UIKeyboardTypeNumberPad;
    
    [view addSubview:self.ubiBefore];
    [view addSubview:self.zafferAdl];
    [view addSubview:self.aasvogelEnd];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(10);
        make.height.equalTo(@44);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label).offset(10);
        make.height.equalTo(@44);
        make.width.equalTo(@80);
        make.top.equalTo(label.mas_bottom);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1);
        make.width.height.equalTo(label1);
        make.top.equalTo(label1.mas_bottom);
    }];
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1);
        make.width.height.equalTo(label1);
        make.top.equalTo(label2.mas_bottom);
    }];
    
    [self.ubiBefore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(10);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
        make.centerY.equalTo(label1);
    }];
    
    [self.zafferAdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.width.equalTo(self.ubiBefore);
        make.centerY.equalTo(label2);
    }];
    
    [self.aasvogelEnd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.width.equalTo(self.ubiBefore);
        make.centerY.equalTo(label3);
    }];
    return view;
}

- (void)addBottomLine:(UIView *)view {
    UIView *line = [[UIView alloc] init];
    [view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(view);
        make.height.equalTo(@1);
    }];
    line.backgroundColor = [UIColor blackColor];
}


- (CGFloat)viewHeight {
    return 94 + 10 + 176 * 2 + 10;
}

@end
