//
//  zhuandaqianTianYaKeepAccountsView.h
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^doneBlock)(NSString *sd);
@interface zhuandaqianTianYaKeepAccountsView : UIView

@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UILabel *incomeL;
@property(nonatomic,strong)UILabel *spendingL;
@property(nonatomic,strong)UILabel *incomeMoney;
@property(nonatomic,strong)UILabel *spendingMoney;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *balanceL;
@property(nonatomic,strong)UILabel *balanceMoney;
//-(void)loadProvicy:(doneBlock)blk;
@end

NS_ASSUME_NONNULL_END
