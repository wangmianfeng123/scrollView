

#ifndef RZRichTextConstant_h
#define RZRichTextConstant_h

typedef NS_ENUM(NSInteger, RZRichTextAttributeType) {
    RZRichTextAttributeTypeNone         = 0,
    RZRichTextAttributeTypeAttachment   = 1,
    RZRichTextAttributeTypeRevoke       = 2,
    RZRichTextAttributeTypeRestore      = 3,
    RZRichTextAttributeTypeFontSize     = 4,
    RZRichTextAttributeTypeFontColor    = 5,
    RZRichTextAttributeTypeFontBackgroundColor = 6,
    RZRichTextAttributeTypeBold         = 7,
    RZRichTextAttributeTypeItalic       = 8,
    RZRichTextAttributeTypeUnderline    = 9,
    RZRichTextAttributeTypeStrikeThrough = 10,
    RZRichTextAttributeTypeMarkUp       = 11,
    RZRichTextAttributeTypeMarkDown     = 12,
    RZRichTextAttributeTypeAligment     = 13,
    RZRichTextAttributeTypeParagraph    = 14,
    RZRichTextAttributeTypeStroke       = 15,
    RZRichTextAttributeTypeExpansion    = 16,
    RZRichTextAttributeTypeShadown      = 17,
    RZRichTextAttributeTypeURL          = 18,
    RZRichTextAttributeTypeEndEdit      = 19,
};

typedef NS_ENUM(NSInteger, RZRichAlertViewType) {
    
    RZRichAlertViewTypeList = 0,
    RZRichAlertViewTypeGrid = 1,
};

#define k_zouxiangni_richImage(name) [UIImage imageNamed:[NSString stringWithFormat:@"%@", name]]

#define rz_rgba(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define rz_rgb(r, g, b) rz_rgba(r, g, b, 1)

#define rz_k_screen_width (UIScreen.mainScreen.bounds.size.width)
#define rz_k_screen_height (UIScreen.mainScreen.bounds.size.height)

#define rz_weakObj(obj)     __weak typeof(obj) obj##Weak = obj;

#define rz_font(size) [UIFont systemFontOfSize:size]
#define rz_fontBold(size) [UIFont boldSystemFontOfSize:size]

#define rz_iPhoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))
#define rz_iPhoneXR (CGSizeEqualToSize(CGSizeMake(414.f, 896.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(896.f, 414.f), [UIScreen mainScreen].bounds.size))
#define rz_iPhone_liuhai (rz_iPhoneX || rz_iPhoneXR)
#define rz_kSafeBottomMargin (rz_iPhone_liuhai ? 34.f: 0.f)

#endif 
