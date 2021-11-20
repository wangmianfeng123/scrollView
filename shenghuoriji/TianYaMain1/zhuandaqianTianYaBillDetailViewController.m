//
//  zhuandaqianTianYaBillDetailViewController.m
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaBillDetailViewController.h"

@interface zhuandaqianTianYaBillDetailViewController ()

@end

@implementation zhuandaqianTianYaBillDetailViewController
@dynamic view;
- (void)loadView
{
    zhuandaqianTianYaBillDetailView *view = [[zhuandaqianTianYaBillDetailView alloc]init];
    self.view = view;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"BillingDetails", nil);
    self.view.moneyTextField.text = _model.bill_money;
    self.view.typeText.text = _model.bill_type;
    self.view.dateText.text = _model.bill_date;
    self.view.noteTextField.text = _model.bill_name;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
