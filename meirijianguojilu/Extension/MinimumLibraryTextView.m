
#import "meirijianguojilu-Swift.h"
#import "MinimumLibraryTextView.h"
#import "tongrentangFinalizerAccessoryView.h"
#import "FabricativeClientViewController.h"
#import "IdePacaViewController.h"



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface MinimumLibraryTextView ()<UITextViewDelegate>

@property (nonatomic, assign) NSRange yacketRange;
@property (nonatomic, copy)   NSString *remoteText;

@property (nonatomic, assign) NSInteger radianCount;

@property (nonatomic, strong) tongrentangFinalizerAccessoryView *namedView;

@property (nonatomic, assign) BOOL editing;

@property (nonatomic, strong) NSMutableArray *multiuserArray;
@property (nonatomic, strong) NSMutableArray *unaryArray;
@end

@implementation MinimumLibraryTextView

- (NSMutableArray *)multiuserArray {
    if (!_multiuserArray) {
        _multiuserArray = [NSMutableArray new];
    }
    return _multiuserArray;
}

- (NSMutableArray *)unaryArray {
    if (!_unaryArray) {
        _unaryArray = [NSMutableArray new];
    }
    return _unaryArray;
}

- (NSMutableDictionary<NSAttributedStringKey,id> *)rightDictionays {
    if (!_rightDictionays) {
        _rightDictionays = [NSMutableDictionary new];
        _rightDictionays[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        _rightDictionays[NSForegroundColorAttributeName] = [UIColor blackColor];
    }
    _rightDictionays[@"NSOriginalFont"] = nil;
    _rightDictionays[@"NSLink"] = nil;
    return _rightDictionays;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) { 
        self.radianCount = 0;
        self.labialMaxrevoke = 20;
        self.delegate = self;
        self.scalableItems = NabeAttributeConfigureManager.manager.scalableItems;
    }
    return self;
}

- (tongrentangFinalizerAccessoryView *)namedView {
    if (!_namedView) {
        _namedView = [[tongrentangFinalizerAccessoryView alloc] initWithFrame:CGRectMake(0, 0, rz_k_screen_width, 44)];
        rz_weakObj(self);
        _namedView.scalableItems = self.scalableItems;
        _namedView.cellForItemAtIndePath = self.cellForItemAtIndePath;
        _namedView.openIndex = ^(NSInteger index) {
            [selfWeak didClickedAttributeIndex:index];
        };
        self.inputAccessoryView = _namedView;
    }
    return _namedView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSAssert([self.delegate isEqual:self], @" ");
}

- (void)didClickedAttributeIndex:(NSInteger)index {
    ScrollMacAttributeItem *item = self.scalableItems[index];
    if (self.handleCell) {
        BOOL flag = self.handleCell(self, item);
        if (flag) {
            return ;
        }
    }
    if (NabeAttributeConfigureManager.manager.handleCell) {
        BOOL flag = NabeAttributeConfigureManager.manager.handleCell(self, item);
        if (flag) {
            return ;
        }
    }
    switch (item.type) {
        case RZRichTextAttributeTypeAttachment: {
            [self inserImage];
            break;
        }
        case RZRichTextAttributeTypeRevoke: {
            [self revokeText:YES];
            break;
        }
        case RZRichTextAttributeTypeRestore: {
            [self revokeText:NO];
            break;
        }
        case RZRichTextAttributeTypeFontSize: {
            [self fontSizeSetting];
            break;
        }
        case RZRichTextAttributeTypeFontColor: {
            [self fontColor];
            break;
        }
        case RZRichTextAttributeTypeFontBackgroundColor: {
            [self fontBgColor];
            break;
        }
        case RZRichTextAttributeTypeBold: {
            UIFont *font = self.rightDictionays[NSFontAttributeName];
            BOOL bold = [font.description containsString:@"font-weight: bold"];
            if (bold) {
                font = [UIFont systemFontOfSize:font.pointSize];
            } else {
                font = [UIFont boldSystemFontOfSize:font.pointSize];
            }
            self.rightDictionays[NSFontAttributeName] = font;
            break;
        }
        case RZRichTextAttributeTypeItalic: {
            [self italic];
            break;
        }
        case RZRichTextAttributeTypeUnderline: {
            [self underLine];
            break;
        }
        case RZRichTextAttributeTypeStrikeThrough: {
            [self deleteLine];
            break;
        }
        case RZRichTextAttributeTypeMarkUp: {
            [self markUp];
            break;
        }
        case RZRichTextAttributeTypeMarkDown: {
            [self markDown];
            break;
        }

        case RZRichTextAttributeTypeStroke: {
            [self miaobian];
            break;
        }
        case RZRichTextAttributeTypeExpansion: {
            [self expansion];
            break;
        }
        case RZRichTextAttributeTypeShadown: {
            [self shadow];
            break;
        }
        case RZRichTextAttributeTypeURL: {
            [self editUrl];
            break;
        }
        case RZRichTextAttributeTypeEndEdit: {
            [[UIApplication sharedApplication].keyWindow endEditing:YES];
            break;
        }
        default: {
            break;
        }
    }
    [self rz_reloadAttributeData];
}

- (void)rz_reloadAttributeData {
    NSMutableDictionary *dict = self.rightDictionays;
    UIColor *textColor = dict[NSForegroundColorAttributeName];
    UIColor *textBgColor = dict[NSBackgroundColorAttributeName];
    UIFont *font = dict[NSFontAttributeName];
    BOOL bold = [font.description containsString:@"font-weight: bold"];
    BOOL italic = [dict[NSObliquenessAttributeName] floatValue] == 0? NO: YES;
    
    UIColor *mbColor = dict[NSStrokeColorAttributeName];
    
    BOOL underLine = [dict[NSUnderlineStyleAttributeName] integerValue] == 0? NO: YES;
    BOOL deleteLine = [dict[NSStrikethroughStyleAttributeName] integerValue] == 0? NO: YES;
    
    NSInteger offline =  [dict[NSBaselineOffsetAttributeName] integerValue];
    BOOL markUp = offline > 0? YES: NO;
    BOOL markDown = offline < 0? YES: NO;
    
    BOOL shadow = dict[NSShadowAttributeName] ? YES : NO;
    
    NSMutableArray <ScrollMacAttributeItem *>*items = self.scalableItems;
    [items enumerateObjectsUsingBlock:^(ScrollMacAttributeItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (obj.type) {
            case RZRichTextAttributeTypeAttachment: {
                break;
            }
            case RZRichTextAttributeTypeRevoke: {
                obj.loaderHighlight = self.multiuserArray.count <= 1? NO : YES;
                break;
            }
            case RZRichTextAttributeTypeRestore: {
                obj.loaderHighlight = self.unaryArray.count;
                break;
            }
            case RZRichTextAttributeTypeFontSize: {
                break;
            }
            case RZRichTextAttributeTypeFontColor: {
                obj.videoParams[@"color"] = textColor;
                break;
            }
            case RZRichTextAttributeTypeFontBackgroundColor: {
                obj.videoParams[@"color"] = textBgColor;
                break;
            }
            case RZRichTextAttributeTypeBold: {
                obj.loaderHighlight = bold;
                break;
            }
            case RZRichTextAttributeTypeItalic: {
                obj.loaderHighlight = italic;
                break;
            }
            case RZRichTextAttributeTypeUnderline: {
                obj.loaderHighlight = underLine;
                break;
            }
            case RZRichTextAttributeTypeStrikeThrough: {
                obj.loaderHighlight = deleteLine;
                break;
            }
            case RZRichTextAttributeTypeMarkUp: {
                obj.loaderHighlight = markUp;
                break;
            }
            case RZRichTextAttributeTypeMarkDown: {
                obj.loaderHighlight = markDown;
                break;
            }
            case RZRichTextAttributeTypeStroke: {
                obj.videoParams[@"color"] = mbColor;
                break;
            }
            case RZRichTextAttributeTypeExpansion: {
                
                break;
            }case RZRichTextAttributeTypeShadown: {
                obj.loaderHighlight = shadow;
                break;
            }
            case RZRichTextAttributeTypeURL: {
    
                break;
            }
            case RZRichTextAttributeTypeEndEdit: {
                
                break;
            }
            default:
                break;
        }
    }];
    [self.namedView reloadData];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray <UIImage *> *)rz_richTextImages {
    return [self.attributedText rz_images];
}

- (NSString *)rz_codingToHtmlWithImageURLS:(NSArray <NSString *> *)urls {
    return [self.attributedText rz_codingToHtmlWithImagesURLSIfHad:urls];
}

#pragma mark - delegate useable
- (void)textViewDidChange:(UITextView *)textView {
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (position) {
            return ;
        }
    }
    if (self.remoteText.length != 0) {
        self.editing = YES;
        NSRange editSelectRange = self.selectedRange; 
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.remoteText];
        [attrString setAttributes:self.rightDictionays range:NSMakeRange(0, attrString.length)];
        
        NSMutableAttributedString *attr = self.attributedText.mutableCopy;
        NSRange changedRange = NSMakeRange(self.yacketRange.location, self.remoteText.length);
        if (changedRange.location + changedRange.length <= attr.length) {
            [attr replaceCharactersInRange:changedRange withAttributedString:attrString];
        }
        [attr removeAttribute:@"NSOriginalFont" range:NSMakeRange(0, attr.length)];
        self.attributedText = attr.copy;
        
        self.selectedRange = editSelectRange;
    }
    self.editing = NO;
    
    if (self.loopChange) {
        self.loopChange(self);
    }
    
    if (self.booleanText){
        self.booleanText(self);
    }
    [self addDataToHistory];
    [self rz_reloadAttributeData];
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if (self.optimizerSelection) {
        self.optimizerSelection(self);
    }
    if (self.editing) {
        return;
    }
    NSMutableDictionary *dict = [self rz_attributesAtSelectedRange].mutableCopy;
    if (dict) {
        self.rightDictionays = dict;
    }
    [self rz_reloadAttributeData];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (self.sliderRange) {
        if (!self.sliderRange(self, range, text)) {
            return NO;
        }
    }
    self.yacketRange = range;
    self.remoteText = text;
    self.editing = YES;
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.temporaryEditing) {
        self.temporaryEditing(self);
    }
    if (self.radianCount == 0) {
        [self addDataToHistory];
    }
    self.radianCount++;
}

#pragma mark - delegate other
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.dependentEditing) {
        self.dependentEditing(self);
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (self.activeEditing) {
        if (!self.activeEditing(self)) {
            return NO;
        }
    }
    [self namedView];
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (self.dacoitEditing) {
        if (!self.dacoitEditing(self)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    if(self.qbeWith) {
        if(!self.qbeWith(self, URL, characterRange, interaction)) {
            return NO;
        }
    }
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    if(self.urlAttachment) {
        if(!self.urlAttachment(self, textAttachment, characterRange, interaction)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if(self.rz_shouldInteractWithURL_ios7) {
        if(!self.rz_shouldInteractWithURL_ios7(self, URL, characterRange)) {
            return NO;
        }
    }
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    if(self.rz_shouldInteractWithTextAttachment_ios7) {
        if(!self.rz_shouldInteractWithTextAttachment_ios7(self, textAttachment, characterRange)) {
            return NO;
        }
    }
    return YES;
}

#pragma mark - default rich function
#pragma mark - 插入图片
- (void)inserImage {
    if (self.rz_richTextImages.count >= 3) {
        [PointGabbyProgress showText:@"Up to three photos"];
        
        return;
    }
    
    
    
    TZImagePickerController *vc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:nil];
    vc.allowPickingVideo = NO;
    vc.allowTakeVideo = NO;
    vc.allowCrop = NO;
    rz_weakObj(self);
    [vc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (photos.count > 0) {
            UIImage *image = photos[0];
            if (selfWeak.qarnnsImage) {
                image = selfWeak.qarnnsImage(image);
            } else if (NabeAttributeConfigureManager.manager.qarnnsImage) {
                image = NabeAttributeConfigureManager.manager.qarnnsImage(image);
            }
            if (!image) {
                return ;
            }
            [selfWeak insertImage:image];
        }
    }];
    vc.imagePickerControllerDidCancelHandle = ^{
        [selfWeak becomeFirstResponder];
    };
    [NabeAttributeConfigureManager.rz_currentViewController presentViewController:vc animated:YES completion:nil];
}

- (void)insertImage:(UIImage *)image {
    rz_weakObj(self);
    
    
    if (!image) {
        return ;
    }
    selfWeak.editing = YES;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    if (width > selfWeak.frame.size.width  - 20) {
        width = selfWeak.frame.size.width  - 20;
        height = height * width / image.size.width;
    }
    NSTextAttachment *attchment = [[NSTextAttachment alloc] init];
    attchment.image = image;
    attchment.bounds = CGRectMake(0, 0, width, height);
    NSMutableAttributedString *imageString = [NSMutableAttributedString attributedStringWithAttachment:attchment].mutableCopy;
    [imageString addAttributes:selfWeak.rightDictionays range:NSMakeRange(0, imageString.length)];
    
    NSMutableAttributedString *attr = selfWeak.attributedText.mutableCopy;
    NSRange selectRaneg = selfWeak.selectedRange;
    [attr replaceCharactersInRange:selectRaneg withAttributedString:imageString];
    selfWeak.attributedText = attr;
    selfWeak.selectedRange = NSMakeRange(selectRaneg.location + imageString.length, 0);
    
    [selfWeak becomeFirstResponder];
    [selfWeak addDataToHistory];
    selfWeak.editing = NO;
    [selfWeak rz_reloadAttributeData];
}
- (void)addDataToHistory {
     rz_weakObj(self);
    NSAttributedString *string = selfWeak.attributedText.copy;
    if (!string) {
        string = [NSAttributedString new];
    }
    NSDictionary *dict = @{@"text":string, @"range":[NSValue valueWithRange:selfWeak.selectedRange]};
    [selfWeak.multiuserArray addObject:dict];
    if (selfWeak.multiuserArray.count > selfWeak.labialMaxrevoke) {
        [selfWeak.multiuserArray removeObjectAtIndex:0];
    }
    [selfWeak.unaryArray removeAllObjects];
}

- (void)revokeText:(BOOL)revoke {
    if (revoke) {
        NSDictionary *currentDict = [self.multiuserArray rz_safeObjAtIndex:self.multiuserArray.count - 2];
        if (currentDict) {
            NSAttributedString *text = currentDict[@"text"];
            NSRange range = [currentDict[@"range"] rangeValue];
            self.attributedText = text;
            self.selectedRange = range;
        }
        NSDictionary *revoeDict = [self.multiuserArray rz_safeObjAtIndex:self.multiuserArray.count - 1];
        if (revoeDict) {
            [self.multiuserArray removeObject:revoeDict];
            [self.unaryArray addObject:revoeDict];
        }
    } else {
        NSDictionary *restore = [self.unaryArray rz_safeObjAtIndex:self.unaryArray.count - 1];
        if (restore) {
            NSAttributedString *text = restore[@"text"];
            NSRange range = [restore[@"range"] rangeValue];
            self.attributedText = text;
            self.selectedRange = range;
            [self.multiuserArray addObject:restore];
            [self.unaryArray removeObject:restore];
        }
    }
}

- (void)fontSizeSetting {
    __block UIFont *font = self.rightDictionays[NSFontAttributeName];
    rz_weakObj(self);
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    vc.jabiruLabel.text =  [NSString stringWithFormat:@"Font size:%@", @(font.pointSize)];
    vc.jabiruLabel.font = font;
    rz_weakObj(vc);
    [vc zadarValue:font.pointSize min:5 max:100 didSliderValueChanged:^(CGFloat value) {
        NSInteger font = (NSInteger)value;
        vcWeak.jabiruLabel.font = [UIFont systemFontOfSize:font];
        vcWeak.jabiruLabel.text = [NSString stringWithFormat:@"Font size:%@", @(font)];
    } complete:^(CGFloat value) {
        UIFont *tempfont = [font fontWithSize:((NSInteger)value)];
        selfWeak.rightDictionays[NSFontAttributeName] = tempfont;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)fontColor {
    UIColor *color = self.rightDictionays[NSForegroundColorAttributeName];
    rz_weakObj(self);
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    vc.jabiruLabel.text = @"Font color";
    vc.jabiruLabel.textColor = color;
    rz_weakObj(vc);
    [vc color:color didChanged:^(UIColor * _Nonnull color) {
        vcWeak.jabiruLabel.textColor = color;
    } complete:^(UIColor * _Nonnull color) {
        selfWeak.rightDictionays[NSForegroundColorAttributeName] = color;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)fontBgColor {
    UIColor *color = self.rightDictionays[NSForegroundColorAttributeName];
    UIColor *bgcolor = self.rightDictionays[NSBackgroundColorAttributeName];
    rz_weakObj(self);
    
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    vc.jabiruLabel.text = @"Font background color";
    vc.jabiruLabel.textColor = color;
    vc.jabiruLabel.backgroundColor = bgcolor;
    rz_weakObj(vc);
    [vc color:[UIColor blackColor] didChanged:^(UIColor * _Nonnull color) {
        vcWeak.jabiruLabel.backgroundColor = color;
    } complete:^(UIColor * _Nonnull color) {
        selfWeak.rightDictionays[NSBackgroundColorAttributeName] = color;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
#pragma mark - 斜体
- (void)italic {
    __block NSInteger type = [self.rightDictionays[NSObliquenessAttributeName] floatValue] * 10;
    rz_weakObj(self);
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text([NSString stringWithFormat:@"Set tilt:%@", @(type)]).font(rz_font(30)).italic(@(type/10.f));
    }];
    rz_weakObj(vc);
    [vc zadarValue:type min:-20 max:20 didSliderValueChanged:^(CGFloat value) {
        type = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Set tilt:%@", @(type)]).font(rz_font(30)).italic(@(type/10.f));
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSObliquenessAttributeName] = @(type/10.f);
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)miaobian {
    __block NSInteger width = [self.rightDictionays[NSStrokeWidthAttributeName] integerValue];
    __block UIColor *color = self.rightDictionays[NSStrokeColorAttributeName];
    
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text([NSString stringWithFormat:@"Stroke a font:%@", @(width)]).font([UIFont systemFontOfSize:40]).strokeWidth(@(width)).strokeColor(color);
    }];
    rz_weakObj(self);
    rz_weakObj(vc);
    [vc zadarValue:width min:-15 max:15 didSliderValueChanged:^(CGFloat value) {
        width = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Stroke a font:%@", @(width)]).font([UIFont systemFontOfSize:40]).strokeWidth(@(width)).strokeColor(color);
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSStrokeWidthAttributeName] = @((NSInteger)value);
        [selfWeak rz_reloadAttributeData];
    }];
    
    [vc color:color didChanged:^(UIColor * _Nonnull tcolor) {
        color = tcolor;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Stroke a font:%@", @(width)]).font([UIFont systemFontOfSize:40]).strokeWidth(@(width)).strokeColor(color);
        }];
    } complete:^(UIColor * _Nonnull color) {
        selfWeak.rightDictionays[NSStrokeColorAttributeName] = color;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)underLine {
    __block NSInteger type = [self.rightDictionays[NSUnderlineStyleAttributeName] integerValue];
    __block UIColor *color = self.rightDictionays[NSUnderlineColorAttributeName];
    
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text([NSString stringWithFormat:@"Underline:%@", @(type)]).font([UIFont systemFontOfSize:40]).underLineStyle(type).underLineColor(color);
    }];
    rz_weakObj(self);
    rz_weakObj(vc);
    [vc zadarValue:type min:0 max:15 didSliderValueChanged:^(CGFloat value) {
        type = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Underline:%@", @(type)]).font([UIFont systemFontOfSize:40]).underLineStyle(type).underLineColor(color);
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSUnderlineStyleAttributeName] = @(type);
        [selfWeak rz_reloadAttributeData];
    }];
    
    [vc color:color didChanged:^(UIColor * _Nonnull tcolor) {
        color = tcolor;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Underline:%@", @(type)]).font([UIFont systemFontOfSize:40]).underLineStyle(type).underLineColor(color);
        }];
    } complete:^(UIColor * _Nonnull color) {
        selfWeak.rightDictionays[NSUnderlineColorAttributeName] = color;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)deleteLine {
    __block NSInteger type = [self.rightDictionays[NSStrikethroughStyleAttributeName] integerValue];
    __block UIColor *color = self.rightDictionays[NSStrikethroughColorAttributeName];
    
    
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text([NSString stringWithFormat:@"Strikethrough:%@", @(type)]).font([UIFont systemFontOfSize:40]).strikeThrough(type).strikeThroughColor(color);
    }];
    rz_weakObj(self);
    rz_weakObj(vc);
    [vc zadarValue:0 min:0 max:15 didSliderValueChanged:^(CGFloat value) {
        type = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Strikethrough:%@", @(type)]).font([UIFont systemFontOfSize:40]).strikeThrough(type).strikeThroughColor(color);
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSStrikethroughStyleAttributeName] = @(type);
        [selfWeak rz_reloadAttributeData];
    }];
    
    [vc color:color didChanged:^(UIColor * _Nonnull tcolor) {
        color = tcolor;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Strikethrough:%@", @(type)]).font([UIFont systemFontOfSize:40]).strikeThrough(type).strikeThroughColor(color);
        }];
    } complete:^(UIColor * _Nonnull color) {
        selfWeak.rightDictionays[NSStrikethroughColorAttributeName] = color;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)markUp {
    __block NSInteger type = [self.rightDictionays[NSBaselineOffsetAttributeName] integerValue];
    if (type < 0) {
        type = 0;
    }
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text(@"This is the baseline: ").font(rz_font(15));
        confer.text([NSString stringWithFormat:@"This is the superscript:%@", @(type)]).font(rz_font(15)).baselineOffset(@(type));
        confer.text(@" This is the baseline").font(rz_font(15));
    }];
    rz_weakObj(self);
    rz_weakObj(vc);
    [vc zadarValue:type min:0 max:100 didSliderValueChanged:^(CGFloat value) {
        type = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text(@"This is the baseline: ").font(rz_font(15));
            confer.text([NSString stringWithFormat:@"This is the superscript:%@", @(type)]).font(rz_font(15)).baselineOffset(@(type));
            confer.text(@" This is the baseline").font(rz_font(15));
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSBaselineOffsetAttributeName] = @(type);
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)markDown {
    __block NSInteger type = [self.rightDictionays[NSBaselineOffsetAttributeName] integerValue];
    if (type > 0) {
        type = 0;
    }
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text(@"This is the baseline: ").font(rz_font(15));
        confer.text([NSString stringWithFormat:@"This is the subscript:%@", @(type)]).font(rz_font(15)).baselineOffset(@(type));
        confer.text(@" This is the baseline").font(rz_font(15));
    }];
    rz_weakObj(self);
    rz_weakObj(vc);
    [vc zadarValue:type min:-100 max:0 didSliderValueChanged:^(CGFloat value) {
        type = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text(@"This is the baseline: ").font(rz_font(15));
            confer.text([NSString stringWithFormat:@"This is the subscript:%@", @(type)]).font(rz_font(15)).baselineOffset(@(type));
            confer.text(@" This is the baseline").font(rz_font(15));
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSBaselineOffsetAttributeName] = @(type);
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}
- (void)expansion {
    __block NSInteger type = (NSInteger)([self.rightDictionays[NSExpansionAttributeName] floatValue] * 10);
    
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    
    [vc.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text([NSString stringWithFormat:@"Set stretch properties:%@", @(type)]).font([UIFont systemFontOfSize:30]).expansion(@(type/10.f)).textColor([UIColor blackColor]);
    }];
    rz_weakObj(self);
    rz_weakObj(vc);
    [vc zadarValue:type min:-20 max:20 didSliderValueChanged:^(CGFloat value) {
        type = (NSInteger)value;
        [vcWeak.jabiruLabel rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text([NSString stringWithFormat:@"Set stretch properties:%@", @(type)]).font([UIFont systemFontOfSize:30]).expansion(@(type/10.f));
        }];
    } complete:^(CGFloat value) {
        selfWeak.rightDictionays[NSExpansionAttributeName] = @(type/10.f);
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}


- (void)shadow {
    __block NSShadow *shadow = [self.rightDictionays[NSShadowAttributeName] copy];
    if (!shadow) {
        shadow = [[NSShadow alloc] init];
    }
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    vc.jabiruLabel.numberOfLines = 2;
    
    NSMutableAttributedString *attr = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
        confer.text(@"Shadow effect").font(rz_font(30));
    }].mutableCopy;
    [attr addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, attr.length)];
    vc.jabiruLabel.attributedText = attr;
    rz_weakObj(vc);
    rz_weakObj(self);
    [vc shadow:shadow didChanged:^(NSShadow * _Nonnull shadow) {
        vcWeak.jabiruLabel.text = nil;
        NSMutableAttributedString *attr1 = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer * _Nonnull confer) {
            confer.text(@"Shadow effect").font(rz_font(30));
        }].mutableCopy;
        [attr1 addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, attr.length)];
        vcWeak.jabiruLabel.attributedText = attr1;
    } complete:^(NSShadow * _Nonnull shadow) {
        if (CGColorEqualToColor(((UIColor *)shadow.shadowColor).CGColor, [UIColor clearColor].CGColor)) {
            shadow = nil;
        }
        selfWeak.rightDictionays[NSShadowAttributeName] = shadow;
        [selfWeak rz_reloadAttributeData];
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}

- (void)editUrl {
    NSArray *urlsString =  [self rz_allUrlAttributedString];
    if (urlsString.count == 0) {
        [self editURL:nil];
        return ;
    }
    IdePacaViewController *vc = [[IdePacaViewController alloc] initWithType:RZRichAlertViewTypeList];
    vc.partTitles = ({
        NSMutableArray *array = [NSMutableArray new];
        [array addObject:@{@"text":@"Add", @"color":[UIColor redColor], @"image":[UIImage new]}];
        for (NSDictionary *dict in urlsString) {
            NSMutableDictionary *tempdict = [NSMutableDictionary dictionaryWithDictionary:dict];
            NSString *text = dict[@"text"];
            NSURL *url = dict[@"url"];
            tempdict[@"text"] = [NSString stringWithFormat:@"%@%@%@", text, (text.length> 0 && url.absoluteString.length > 0) ? @"\n":@"", url.absoluteString];
            tempdict[@"image"] = [dict[@"image"] isKindOfClass:[UIImage class]]? dict[@"image"]: [UIImage new];
            [array addObject:tempdict];
        }
        array;
    });
    rz_weakObj(self);
    vc.associativeSelected = ^(NSUInteger index, BOOL isCancel) {
        if (isCancel) {
            return ;
        }
        NSDictionary *dict;
        if (index > 0) {
            dict = [urlsString rz_safeObjAtIndex:(index - 1)];
        }
        [selfWeak editURL:dict];
    };
    [vc show];
}

- (void)editURL:(NSDictionary *)dict {
    FabricativeClientViewController *vc = [[FabricativeClientViewController alloc] init];
    rz_weakObj(self);
    [vc foreignString:dict[@"attr"] didEditComplete:^(NSAttributedString * _Nonnull foreignString) {
        NSMutableAttributedString *tempUrl = foreignString.mutableCopy;
        [tempUrl addAttributes:selfWeak.rightDictionays range:NSMakeRange(0, foreignString.length)];
        NSMutableAttributedString *text = selfWeak.attributedText.mutableCopy;
        if (dict) {
            NSRange range = [dict[@"range"] rangeValue];
            [text replaceCharactersInRange:range withAttributedString:tempUrl];
        } else {
            [text appendAttributedString:tempUrl];
        }
        selfWeak.attributedText = text;
    }];
    [NabeAttributeConfigureManager presentViewController:vc animated:YES];
}

@end
#pragma clang diagnostic pop
