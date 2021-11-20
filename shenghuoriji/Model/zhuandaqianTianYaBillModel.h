//
//  zhuandaqianTianYaBillModel.h
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "BQLDBModel.h"
#define BillListFile @"BillList.sqlite"

NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaBillModel : BQLDBModel
//zhuandaqian
@property(nonatomic,copy)NSString *bill_type;
@property(nonatomic,copy)NSString *bill_name;
@property(nonatomic,copy)NSString *bill_image;
@property(nonatomic,copy)NSString *bill_money;
@property(nonatomic,copy)NSString *bill_date;
@property(nonatomic,copy)NSString *bill_note;

@end

NS_ASSUME_NONNULL_END
