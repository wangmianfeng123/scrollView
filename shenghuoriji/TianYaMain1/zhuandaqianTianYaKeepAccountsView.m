//
//  zhuandaqianTianYaKeepAccountsView.m
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaKeepAccountsView.h"
#import "TianYaE_Macro.h"
@implementation zhuandaqianTianYaKeepAccountsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"efefef"];
        _headView = [[UIView alloc]init];
        _headView.userInteractionEnabled = YES;
        _headView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_headView];
        
        _incomeL= [[UILabel alloc]init];
        _incomeL.text = @"Income";
        _incomeL.textColor = [UIColor colorWithHexString:@"808080"];
        _incomeL.textAlignment = NSTextAlignmentCenter;
        _incomeL.font = [UIFont systemFontOfSize:14];
        [_headView addSubview:_incomeL];
        
        _spendingL= [[UILabel alloc]init];
        _spendingL.text = @"Spending";
        _spendingL.textAlignment = NSTextAlignmentCenter;
        _spendingL.textColor = [UIColor colorWithHexString:@"808080"];
        _spendingL.font = [UIFont systemFontOfSize:14];
        [_headView addSubview:_spendingL];
        _balanceL= [[UILabel alloc]init];
        _balanceL.text = @"Balance";
        _balanceL.textAlignment = NSTextAlignmentCenter;
        _balanceL.textColor = [UIColor colorWithHexString:@"808080"];
        _balanceL.font = [UIFont systemFontOfSize:14];
        [_headView addSubview:_balanceL];
        
        _incomeMoney= [[UILabel alloc]init];
        _incomeMoney.text = @"0.00";
        _incomeMoney.textAlignment = NSTextAlignmentCenter;
        _incomeMoney.textColor = [UIColor blackColor];
        _incomeMoney.font = [UIFont systemFontOfSize:16];
        [_headView addSubview:_incomeMoney];
        
        _spendingMoney= [[UILabel alloc]init];
        _spendingMoney.text = @"0.00";
        _spendingMoney.textAlignment = NSTextAlignmentCenter;
        _spendingMoney.textColor = [UIColor blackColor];
        _spendingMoney.font = [UIFont systemFontOfSize:16];
        [_headView addSubview:_spendingMoney];
        
        _balanceMoney= [[UILabel alloc]init];
        _balanceMoney.text = @"0.00";
        _balanceMoney.textAlignment = NSTextAlignmentCenter;
        _balanceMoney.textColor = [UIColor blackColor];
        _balanceMoney.font = [UIFont systemFontOfSize:16];
        [_headView addSubview:_balanceMoney];
        
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];

    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGSize boundSize = self.bounds.size;
    
    _headView.frame = CGRectMake(0, SafeAreaTopHeight, boundSize.width, 120);

    _incomeL.frame = CGRectMake(0, 30, boundSize.width/3, 20);
    _spendingL.frame = CGRectMake(_incomeL.right, 30, boundSize.width/3, 20);
    _balanceL.frame = CGRectMake(_spendingL.right, 30, boundSize.width/3, 20);

    _incomeMoney.frame = CGRectMake(0, _incomeL.bottom+20, boundSize.width/3, 30);
    _spendingMoney.frame = CGRectMake(_incomeMoney.right, _spendingL.bottom+20, boundSize.width/3, 30);
    _balanceMoney.frame = CGRectMake(_spendingMoney.right, _spendingL.bottom+20, boundSize.width/3, 30);

    _tableView.frame = CGRectMake(0, _headView.bottom+30, boundSize.width, boundSize.height-SafeAreaTopHeight-100-SafeAreaBottomHeight);

}


@end
