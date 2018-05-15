//
//  FLHomeBodyViewCell.m
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//


#import "FLHomeBodyViewCell.h"

@implementation FLHomeBodyViewCell{
    
    UILabel *detailLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        detailLabel = [[UILabel alloc] init];
        [detailLabel setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:detailLabel];
    }
    return self;
}



-(void)setClassID:(NSString *)classID{
    
    [detailLabel setText:classID];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [detailLabel setFrame:self.bounds];
}
@end
