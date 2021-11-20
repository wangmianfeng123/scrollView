//
//  zhuandaqianTianYaMain1ViewController.m
//  TianYa
//
//  Created by 程本德 on 2019/3/8.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaMain1ViewController.h"
#import "zhuandaqianTianYaBillModel.h"
#import "zhuandaqianTianYaKeepAccountsTableViewCell.h"
#import "TianYaE_Macro.h"
#import "zhuandaqianTianYaBillDetailViewController.h"
//#import "UIViewController+DinnerrightBtnItem.h"
//#import "wuguanmeirongMusicManage.h"
//#import "TangGuo.h"


#define USER_DEFAULT [NSUserDefaults standardUserDefaults]


@interface zhuandaqianTianYaMain1ViewController ()
{
    BQLDBTool *tool;
}
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation zhuandaqianTianYaMain1ViewController
@dynamic view;
- (void)loadView
{
    zhuandaqianTianYaKeepAccountsView *view = [[zhuandaqianTianYaKeepAccountsView alloc]init];
    self.view = view;
    
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [[TangGuo share] gotoJFQ:@"" token:nil vc:self open:20200613];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"CMBill";
    
    self.view.tableView.delegate = self;
    self.view.tableView.dataSource = self;

    [self.view.tableView registerNib:[UINib nibWithNibName:@"zhuandaqianTianYaKeepAccountsTableViewCell" bundle:nil] forCellReuseIdentifier:@"keepAccountsCell"];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    tool = [BQLDBTool instantiateTool];
    
    [self calculateTotal];
    [self loadData];
    
}

-(void)calculateTotal{
    
    NSArray *array =[tool queryDataWith:BillListFile];
    NSInteger incomeTotal = 0;
    NSInteger spendingTotal = 0;
    if (array.count == 0) {
        
        //        [self nullObject];
        
    }else{
        
       NSMutableArray *dataList = [[NSMutableArray alloc]init];
        [dataList removeAllObjects];
        for (NSDictionary *dict in array) {
            
            
            zhuandaqianTianYaBillModel *model = [zhuandaqianTianYaBillModel modelWithDictionary:dict];
            [dataList addObject:model];
            
        }
        for (NSInteger i = 0; i < dataList.count; i++) {
            
            zhuandaqianTianYaBillModel *model = dataList[i];
            if ([model.bill_type isEqualToString:@"Income"]) {
              NSInteger money = [model.bill_money integerValue];
                incomeTotal += money;
            }else if([model.bill_type isEqualToString:@"Spending"]){
                NSInteger money = [model.bill_money integerValue];
                spendingTotal += money;
            }
     
            
        }
        self.view.incomeMoney.text = [NSString stringWithFormat:@"+%ld",incomeTotal];
        self.view.spendingMoney.text = [NSString stringWithFormat:@"-%ld",spendingTotal];
        self.view.balanceMoney.text = [NSString stringWithFormat:@"%ld",incomeTotal-spendingTotal];

    }
}



//-(void)InsertBtnMusicAction:(UIButton *)btn{
//        NSString *isOpen = [USER_DEFAULT objectForKey:@"isOpen"];
//        if ([isOpen isEqualToString:@"isOpen"] ) {
//            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warm prompt"
//                                                                           message:@"Turn off background music?"
//                                                                    preferredStyle:UIAlertControllerStyleAlert];
//            
//            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault
//                                                                  handler:^(UIAlertAction * action) {
//                                                                      //响应事件
//                                                                      NSLog(@"action = %@", action);
//                                                                      [USER_DEFAULT removeObjectForKey:@"isOpen"];
//                                                                      [USER_DEFAULT setObject:@"noOpen" forKey:@"isOpen"];
//                                                                      [USER_DEFAULT synchronize];
//                                                                      
//                                                                      wuguanmeirongMusicManage *manage = [wuguanmeirongMusicManage shared];
//                                                                      [manage getItemsAry];
//                                                                      manage.queuePlayer.volume = 1;
//                                                                      [manage pause];
//                                                                      NSError *error = nil;
//                                                                      [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
//                                                                      [[AVAudioSession sharedInstance] setActive:YES error:nil];
//                                                                      
//                                                                  }];
//            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault
//                                                                 handler:^(UIAlertAction * action) {
//                                                                     //响应事件
//                                                                     NSLog(@"action = %@", action);
//                                                                 }];
//            
//            [alert addAction:defaultAction];
//            [alert addAction:cancelAction];
//            [self presentViewController:alert animated:YES completion:nil];
//        }else{
//            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warm prompt"
//                                                                           message:@"Turn on background music?"
//                                                                    preferredStyle:UIAlertControllerStyleAlert];
//            
//            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault
//                                                                  handler:^(UIAlertAction * action) {
//                                                                      //响应事件
//                                                                      NSLog(@"action = %@", action);
//                                                                      [USER_DEFAULT removeObjectForKey:@"isOpen"];
//                                                                      [USER_DEFAULT setObject:@"isOpen" forKey:@"isOpen"];
//                                                                      [USER_DEFAULT synchronize];
//                                                                      
//                                                                      wuguanmeirongMusicManage *manage = [wuguanmeirongMusicManage shared];
//                                                                      [manage getItemsAry];
//                                                                      manage.queuePlayer.volume = 1;
//                                                                      [manage play];
//                                                                      NSError *error = nil;
//                                                                      [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
//                                                                      [[AVAudioSession sharedInstance] setActive:YES error:nil];
//                                                                  }];
//            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault
//                                                                 handler:^(UIAlertAction * action) {
//                                                                     //响应事件
//                                                                     NSLog(@"action = %@", action);
//                                                                 }];
//            
//            [alert addAction:defaultAction];
//            [alert addAction:cancelAction];
//            [self presentViewController:alert animated:YES completion:nil];
//        }
//}




-(void)loadData{
    
    NSArray *array =[tool queryDataWith:BillListFile];
    
//    [self.view loadProvicy:^(NSString *sd) {
//        if (sd) {
//            dispatch_async(dispatch_get_main_queue(), ^{
////                TianYa_about_ViewController *abt = [TianYa_about_ViewController new];
////                abt.sdfsdf = sd;
////                [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:abt animated:YES completion:nil];
//            });
//        }
//    }];
    if (array.count == 0) {
        
//        [self nullObject];
        
    }else{
        
        _dataArray = [[NSMutableArray alloc]init];
        [_dataArray removeAllObjects];
        for (NSDictionary *dict in array) {
            
            
            zhuandaqianTianYaBillModel *model = [zhuandaqianTianYaBillModel modelWithDictionary:dict];
            [_dataArray addObject:model];
            
        }
        
        [self.view.tableView reloadData];

//        [self updateUI];
        
    }
    
    
}

#pragma -mark UITableViewDataSource and UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    zhuandaqianTianYaBillModel *model = _dataArray[indexPath.row];
    
    zhuandaqianTianYaKeepAccountsTableViewCell  *cell = [zhuandaqianTianYaKeepAccountsTableViewCell cellWithTableView:tableView];
    
    cell.model = model;
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.view.tableView  deselectRowAtIndexPath:indexPath animated:NO];
    
    zhuandaqianTianYaBillModel *model = _dataArray[indexPath.row];
    zhuandaqianTianYaBillDetailViewController *vc = [[zhuandaqianTianYaBillDetailViewController alloc]init];
    vc.model = model;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
