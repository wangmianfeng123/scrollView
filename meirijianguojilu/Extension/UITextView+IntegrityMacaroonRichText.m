

#import "UITextView+IntegrityMacaroonRichText.h"
#import <RZColorful/NSAttributedString+RZColorful.h>
#import "NabeAttributeConfigureManager.h"

@implementation UITextView (RZRichText)
- (NSDictionary <NSAttributedStringKey, id> *)rz_attributesAtSelectedRange {
    NSInteger length = self.attributedText.length;
    if (length == 0) {
        return nil;
    }
    NSInteger index = self.selectedRange.location - 1;
    if (index < 0) {
        index = 0;
    }
    NSRange range = NSMakeRange(0, 1);
    NSDictionary *dict = [self.attributedText attributesAtIndex:index effectiveRange:&range];
    return dict;
}


- (NSArray <NSDictionary <NSAttributedString *, id> *> *)rz_allUrlAttributedString {
    if (self.attributedText.length == 0) {
        return nil;
    }
    NSMutableArray *attris = [NSMutableArray new];
    [self.attributedText enumerateAttribute:NSLinkAttributeName inRange:NSMakeRange(0, self.attributedText.length) options:NSAttributedStringEnumerationReverse usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        if ([value isKindOfClass:[NSURL class]] && value) {
            NSAttributedString *string = [self.attributedText attributedSubstringFromRange:range];
            NSArray *array = [string rz_images];
            NSString *text = string.string;
            {
                text = [text stringByReplacingOccurrencesOfString:@"\U0000fffc" withString:@""];
                text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
            }
            [attris addObject:@{@"text":text, @"url":value, @"range":[NSValue valueWithRange:range], @"attr":string, @"image":[array rz_safeObjAtIndex:0]? :@(NO)}];
        } 
    }];
    return attris;
}

@end
