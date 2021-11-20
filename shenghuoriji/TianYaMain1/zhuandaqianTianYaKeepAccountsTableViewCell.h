//
//  zhuandaqianTianYaKeepAccountsTableViewCell.h
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class zhuandaqianTianYaBillModel;
NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaKeepAccountsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_name;
@property (weak, nonatomic) IBOutlet UILabel *type_name;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (nonatomic,strong)zhuandaqianTianYaBillModel *model;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
