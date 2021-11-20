//
//  zhuandaqianTianYaClassificationManagementView.h
//  TianYa
//
//  Created by 程本德 on 2019/3/11.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaClassificationManagementView : UIView
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UISegmentedControl *segment;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *footView;
@property(nonatomic,strong)UILabel *customLable;

@end

NS_ASSUME_NONNULL_END
