//
//  zhuandaqianTianYaBillDetailViewController.h
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhuandaqianTianYaBillDetailView.h"
#import "zhuandaqianTianYaBillModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaBillDetailViewController : UIViewController
@property(nonatomic,strong)zhuandaqianTianYaBillDetailView *view;
@property(nonatomic,strong)zhuandaqianTianYaBillModel *model;

@end

NS_ASSUME_NONNULL_END
