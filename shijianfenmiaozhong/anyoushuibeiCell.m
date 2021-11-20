//
//  anyoushuibeiCell.m
//  DMinutes
//
//  Created by MoMo on 2019/5/17.
//  Copyright © 2019 DM. All rights reserved.
//

#import "anyoushuibeiCell.h"

@implementation anyoushuibeiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.note.lineBreakMode =NSLineBreakByCharWrapping;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.title sizeThatFits:size].height;
    totalHeight += [self.catoary sizeThatFits:size].height;
    totalHeight += [self.date sizeThatFits:size].height;
    totalHeight += [self.destdate sizeThatFits:size].height;
    totalHeight += [self.note sizeThatFits:size].height;
    totalHeight += 100; // margins

    return CGSizeMake(size.width, totalHeight);
}
@end
