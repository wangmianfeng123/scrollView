//
//  zhuandaqianTianYaClassificationTableViewCell.h
//  TianYa
//
//  Created by 程本德 on 2019/3/13.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class zhuandaqianTianYaClassificationManagementModel;
@interface zhuandaqianTianYaClassificationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgName;
@property (weak, nonatomic) IBOutlet UILabel *classificationName;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (nonatomic,strong)zhuandaqianTianYaClassificationManagementModel *model;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
