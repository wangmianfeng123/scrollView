//
//  zhuandaqianTianYaClassificationManagementViewController.h
//  TianYa
//
//  Created by 程本德 on 2019/3/11.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhuandaqianTianYaClassificationManagementView.h"
NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaClassificationManagementViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)zhuandaqianTianYaClassificationManagementView *view;

@end

NS_ASSUME_NONNULL_END
