//
//  zhuandaqianTianYaMain1ViewController.h
//  TianYa
//
//  Created by 程本德 on 2019/3/8.
//  Copyright © 2019 cbd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhuandaqianTianYaKeepAccountsView.h"
NS_ASSUME_NONNULL_BEGIN

@interface zhuandaqianTianYaMain1ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)zhuandaqianTianYaKeepAccountsView *view;

@end

NS_ASSUME_NONNULL_END
