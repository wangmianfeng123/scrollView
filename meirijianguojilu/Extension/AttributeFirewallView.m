

#import "AttributeFirewallView.h"
#import <Masonry/Masonry.h>
#import "RZRichTextConstant.h"
#import "NabeAttributeConfigureManager.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import <RZColorful/NSAttributedString+RZColorful.h>

@interface AttributeFirewallView ()

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) UIButton *childBtn;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextField *zagField;

@end

@implementation AttributeFirewallView



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.childBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.childBtn];
        [self.childBtn setImage:k_zouxiangni_richImage(@"viable_url") forState:UIControlStateNormal];
        
        self.textField = [[UITextField alloc] init];
        [self addSubview:self.textField];
        self.textField.placeholder = @"Please enter the content";
        self.textField.layer.borderColor = rz_rgb(238, 238, 238).CGColor;
        self.textField.layer.borderWidth = 1;
        [self.textField addTarget:self action:@selector(resetURLString) forControlEvents:UIControlEventEditingChanged];
        
        self.zagField = [[UITextField alloc] init];
        [self addSubview:self.zagField];
        self.zagField.placeholder = @"Url";
        self.zagField.layer.borderColor = rz_rgb(238, 238, 238).CGColor;
        self.zagField.layer.borderWidth = 1;
        [self.zagField addTarget:self action:@selector(resetURLString) forControlEvents:UIControlEventEditingChanged];
        self.zagField.keyboardType = UIKeyboardTypeURL;
        
        [self.childBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self);
            make.width.height.equalTo(@60);
        }];
        
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.childBtn.mas_bottom).offset(10);
            make.height.equalTo(@44);
            make.width.equalTo(@300);
        }];
        
        [self.zagField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.mas_bottom).offset(10);
            make.centerX.height.width.equalTo(self.textField);
            make.bottom.equalTo(self).offset(-10);
        }];
        
        [self.childBtn addTarget:self action:@selector(imageBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (CGFloat)viewHeight {
    return  178;
}

- (void)setForeignString:(NSAttributedString *)foreignString {
    _foreignString = foreignString;
    NSInteger length = foreignString.length;
    if (length == 0) {
        return ;
    }
    
    NSArray *images = _foreignString.rz_images;
    if (images.count > 0) {
        self.image = images[0];
        [self.childBtn setImage:self.image forState:UIControlStateNormal];
    }
    self.textField.text = _foreignString.string;
    
  
    NSRange range = NSMakeRange(0, 1);
    NSDictionary *attrDict = [foreignString attributesAtIndex:0 effectiveRange:&range];
    self.zagField.text = [(NSURL *)attrDict[NSLinkAttributeName] absoluteString];
}

- (void)imageBtnClicked:(UIButton *)sender {
    if (self.image) {
        [self delegateImage];
    } else {
        [self inserImage];
    }
}

- (void)delegateImage {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Prompt" message:@"Do you want to delete the picture?" preferredStyle:UIAlertControllerStyleActionSheet];
    rz_weakObj(self);
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        selfWeak.image = nil;
        [selfWeak.childBtn setImage:k_zouxiangni_richImage(@"viable_url") forState:UIControlStateNormal];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:confirm];
    [alert addAction:cancel];
    [NabeAttributeConfigureManager.rz_currentViewController presentViewController:alert animated:YES completion:nil];
}
- (void)inserImage {
    TZImagePickerController *vc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:nil];
    vc.allowPickingVideo = NO;
    vc.allowTakeVideo = NO;
    vc.allowCrop = NO;
    rz_weakObj(self);
    [vc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (photos.count > 0) {
            UIImage *image = photos[0];
            if (NabeAttributeConfigureManager.manager.qarnnsImage) {
                image = NabeAttributeConfigureManager.manager.qarnnsImage(image);
            }
            if (!image) {
                return ;
            }
            selfWeak.image = image;
            [selfWeak.childBtn setImage:image forState:UIControlStateNormal];
            [selfWeak resetURLString];
        }
    }];
    [NabeAttributeConfigureManager.rz_currentViewController presentViewController:vc animated:YES completion:nil];
}

- (void)resetURLString {
    rz_weakObj(self);
    NSAttributedString *attr = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
        if (selfWeak.image) {
            CGFloat width = selfWeak.image.size.width;
            CGFloat height = selfWeak.image.size.height;
            
        }
        confer.text(selfWeak.textField.text).url([NSURL URLWithString:selfWeak.zagField.text]);
    }];
    _foreignString = attr.copy;
}

@end
