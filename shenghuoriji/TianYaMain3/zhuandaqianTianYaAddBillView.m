//
//  zhuandaqianTianYaAddBillView.m
//  TianYa
//
//  Created by 程本德 on 2019/3/14.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaAddBillView.h"
#import "TianYaE_Macro.h"
@implementation zhuandaqianTianYaAddBillView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
        _headView = [[UIView alloc]init];
        _headView.userInteractionEnabled = YES;
        _headView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_headView];
        
        _segment = [[UISegmentedControl alloc] initWithItems:@[@"Spending",@"Income"]];
        _segment.tintColor = [UIColor colorWithHexString:@"808080"];
        _segment.selectedSegmentIndex = 0;
        [_headView addSubview:_segment];
        
        _collectionView = [[UIView alloc]init];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_collectionView];
        
        _contentView = [[UIView alloc]init];
        _contentView.userInteractionEnabled = YES;
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        _moneyL = [[UILabel alloc]init];
        _moneyL.text = @"Money";
        _moneyL.textColor = [UIColor colorWithHexString:@"808080"];
        _moneyL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_moneyL];
        
        _moneyTextField = [[UITextField alloc]init];
        _moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
        _moneyTextField.placeholder = @"Please enter the amount";
        _moneyTextField.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_moneyTextField];
        
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        [_contentView addSubview:_line1];
        
        _typeL = [[UILabel alloc]init];
        _typeL.text = @"Type";
        _typeL.textColor = [UIColor colorWithHexString:@"808080"];
        _typeL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_typeL];
        
        _typeText = [[UILabel alloc]init];
        _typeText.text = @"";
        _typeText.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_typeText];
        
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        [_contentView addSubview:_line2];
        
        _dateL = [[UILabel alloc]init];
        _dateL.text = @"Date";
        _dateL.textColor = [UIColor colorWithHexString:@"808080"];
        _dateL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_dateL];
        
        _dateText = [[UILabel alloc]init];
        _dateText.text = @"";
        _dateText.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_dateText];
        
        _line3 = [[UIView alloc]init];
        _line3.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        [_contentView addSubview:_line3];
        
        _noteL = [[UILabel alloc]init];
        _noteL.text = @"Note";
        _noteL.textColor = [UIColor colorWithHexString:@"808080"];
        _noteL.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_noteL];
        
        _noteTextField = [[UITextField alloc]init];
        _noteTextField.placeholder =@"Note the" ;
        _noteTextField.font = [UIFont systemFontOfSize:14];
        [_contentView addSubview:_noteTextField];
        
        _commitBtn = [[UIButton alloc]init];
        [_commitBtn setTitle:@"Submit" forState:UIControlStateNormal];
        _commitBtn.backgroundColor = [UIColor colorWithHexString:@"808080"];
        [self addSubview:_commitBtn];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGSize boundSize = self.bounds.size;

    _headView.frame = CGRectMake(0, SafeAreaTopHeight+20, boundSize.width, 70);
    _segment.frame = CGRectMake(boundSize.width/2-225/2,10, 225, 30);
    _collectionView.frame =CGRectMake(0,_headView.bottom+20, boundSize.width, 200);
    _contentView.frame = CGRectMake(0, _collectionView.bottom + 20, boundSize.width, 160);
    
    _moneyL.frame = CGRectMake(10, 10, 50, 20);
    _moneyTextField.frame = CGRectMake(_moneyL.right+10, 10, boundSize.width-10-_moneyL.width-10, 20);
    _line1.frame = CGRectMake(0, _moneyL.bottom+10, boundSize.width, 1);
    _typeL.frame = CGRectMake(10, _line1.bottom+10, 50, 20);
    _typeText.frame = CGRectMake(_typeL.right+10, _line1.bottom+10, boundSize.width-_typeL.width-10-10, 20);
    _line2.frame = CGRectMake(0, _typeL.bottom+10, boundSize.width, 1);
    _dateL.frame = CGRectMake(10, _line2.bottom+10, 50, 20);
    _dateText.frame = CGRectMake(_dateL.right+10, _line2.bottom+10, boundSize.width-_dateL.width-10-10, 20);
    _line3.frame = CGRectMake(0, _dateL.bottom+10, boundSize.width, 1);
    _noteL.frame = CGRectMake(10, _line3.bottom+10, 50, 20);
    _noteTextField.frame = CGRectMake(_noteL.right+10, _line3.bottom+10, boundSize.width-_noteL.width-10-10, 20);
    _commitBtn.frame = CGRectMake(40, _contentView.bottom+10, boundSize.width-80, 40);
}

@end
