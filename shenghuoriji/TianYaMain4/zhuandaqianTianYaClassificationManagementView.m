//
//  zhuandaqianTianYaClassificationManagementView.m
//  TianYa
//
//  Created by 程本德 on 2019/3/11.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaClassificationManagementView.h"
#import "TianYaE_Macro.h"
@implementation zhuandaqianTianYaClassificationManagementView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"efefef"];
        
        _headView = [[UIView alloc]init];
        _headView.userInteractionEnabled = YES;
        _headView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_headView];
        _segment = [[UISegmentedControl alloc] initWithItems:@[@"Spending",@"Income"]];
        _segment.tintColor = [UIColor colorWithHexString:@"808080"];
        _segment.selectedSegmentIndex = 0;
        [_headView addSubview:_segment];
        
    
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        
        _footView = [[UIView alloc]init];
        _footView.backgroundColor = [UIColor whiteColor];
        _footView.userInteractionEnabled = YES;
        [self addSubview:_footView];
        
    
        _customLable = [[UILabel alloc]init];
        _customLable.text = @"+Custom Category";
        _customLable.userInteractionEnabled = YES;
        _customLable.font = [UIFont systemFontOfSize:14];
        _customLable.textAlignment = NSTextAlignmentCenter;
        [_footView addSubview:_customLable];
        
        
        
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize boundSize = self.bounds.size;
    _headView.frame = CGRectMake(0, SafeAreaTopHeight+20, boundSize.width, 70);
    _segment.frame = CGRectMake(boundSize.width/2-225/2,20, 225, 30);
    _tableView.frame =CGRectMake(0,_headView.bottom+20, boundSize.width, boundSize.height-SafeAreaTopHeight-_headView.height-20-80);
    
    _footView.frame = CGRectMake(0, boundSize.height-80, boundSize.width, 80);
    _customLable.frame = CGRectMake(0, 10, boundSize.width, 20);
    
    
}

@end
