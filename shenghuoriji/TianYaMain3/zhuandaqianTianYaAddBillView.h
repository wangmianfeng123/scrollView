//
//  zhuandaqianTianYaAddBillView.h
//  TianYa
//
//  Created by 程本德 on 2019/3/14.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaAddBillView : UIView

@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UISegmentedControl *segment;
@property(nonatomic,strong)UIView *collectionView;

@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UILabel *moneyL;
@property(nonatomic,strong)UITextField *moneyTextField;
@property(nonatomic,strong)UIView *line1;
@property(nonatomic,strong)UILabel *typeL;
@property(nonatomic,strong)UILabel *typeText;
@property(nonatomic,strong)UIView *line2;
@property(nonatomic,strong)UILabel *dateL;
@property(nonatomic,strong)UILabel *dateText;
@property(nonatomic,strong)UIView *line3;
@property(nonatomic,strong)UILabel *noteL;
@property(nonatomic,strong)UITextField *noteTextField;
@property(nonatomic,strong)UIButton *commitBtn;

@end

NS_ASSUME_NONNULL_END
