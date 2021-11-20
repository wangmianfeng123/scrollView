//
//  zhuandaqianTianYaAddPillCollectionViewCell.h
//  TianYa
//
//  Created by 程本德 on 2019/3/14.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhuandaqianTianYaClassificationManagementModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaAddPillCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img_name;
@property (weak, nonatomic) IBOutlet UILabel *classification_name;

@property (nonatomic,strong) zhuandaqianTianYaClassificationManagementModel *model;

@end

NS_ASSUME_NONNULL_END
