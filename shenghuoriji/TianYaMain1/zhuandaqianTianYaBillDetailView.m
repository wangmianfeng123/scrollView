//
//  zhuandaqianTianYaBillDetailView.m
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaBillDetailView.h"
#import "TianYaE_Macro.h"
@implementation zhuandaqianTianYaBillDetailView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
 
        
        _contentView = [[UIView alloc]init];
        _contentView.userInteractionEnabled = YES;
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        _moneyL = [[UILabel alloc]init];
        _moneyL.text = NSLocalizedString(@"Money", nil);
        _moneyL.textColor = [UIColor colorWithHexString:@"808080"];
        _moneyL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_moneyL];
        
        _moneyTextField = [[UILabel alloc]init];
        _moneyTextField.font = [UIFont systemFontOfSize:14];
        _moneyTextField.textColor = [UIColor blackColor];
        _moneyTextField.textAlignment = NSTextAlignmentRight;

        [_contentView addSubview:_moneyTextField];
        
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        [_contentView addSubview:_line1];
        
        _typeL = [[UILabel alloc]init];
        _typeL.text = NSLocalizedString(@"Type", nil);
        _typeL.textColor = [UIColor colorWithHexString:@"808080"];
        _typeL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_typeL];
        
        _typeText = [[UILabel alloc]init];
        _typeText.text = @"";
        _typeText.textAlignment = NSTextAlignmentRight;

        _typeText.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_typeText];
        
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        [_contentView addSubview:_line2];
        
        _dateL = [[UILabel alloc]init];
        _dateL.text = NSLocalizedString(@"Date", nil);;
        _dateL.textColor = [UIColor colorWithHexString:@"808080"];
        _dateL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_dateL];
        
        _dateText = [[UILabel alloc]init];
        _dateText.text = @"";
        _dateText.textAlignment = NSTextAlignmentRight;

        _dateText.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_dateText];
        
        _line3 = [[UIView alloc]init];
        _line3.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        [_contentView addSubview:_line3];
        
        _noteL = [[UILabel alloc]init];
        _noteL.text = NSLocalizedString(@"Note", nil);
        _noteL.textColor = [UIColor colorWithHexString:@"808080"];
        _noteL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_noteL];
        
        _noteTextField = [[UILabel alloc]init];
        _noteTextField.textAlignment = NSTextAlignmentRight;
        _noteTextField.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_noteTextField];
        

        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGSize boundSize = self.bounds.size;
    
    _contentView.frame = CGRectMake(0, SafeAreaTopHeight+ 20, boundSize.width, 200);
    
    _moneyL.frame = CGRectMake(10, 15, 50, 20);
    _moneyTextField.frame = CGRectMake(_moneyL.right+10, 10, boundSize.width-10-_moneyL.width-10-20, 20);
    _line1.frame = CGRectMake(0, _moneyL.bottom+15, boundSize.width, 1);
    _typeL.frame = CGRectMake(10, _line1.bottom+15, 50, 20);
    _typeText.frame = CGRectMake(_typeL.right+10, _line1.bottom+15, boundSize.width-_typeL.width-10-10-20, 20);
    _line2.frame = CGRectMake(0, _typeL.bottom+15, boundSize.width, 1);
    _dateL.frame = CGRectMake(10, _line2.bottom+15, 50, 20);
    _dateText.frame = CGRectMake(_dateL.right+10, _line2.bottom+15, boundSize.width-_dateL.width-10-10-20, 20);
    _line3.frame = CGRectMake(0, _dateL.bottom+15, boundSize.width, 1);
    _noteL.frame = CGRectMake(10, _line3.bottom+15, 50, 20);
    _noteTextField.frame = CGRectMake(_noteL.right+10, _line3.bottom+15, boundSize.width-_noteL.width-10-10-20, 20);
    
}
@end
