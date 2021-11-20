//
//  zhuandaqianTianYaClassificationManagementViewController.m
//  TianYa
//
//  Created by 程本德 on 2019/3/11.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaClassificationManagementViewController.h"
#import "zhuandaqianTianYaClassificationManagementModel.h"
#import "zhuandaqianTianYaClassificationTableViewCell.h"
#import "TianYaE_Macro.h"
@interface zhuandaqianTianYaClassificationManagementViewController ()

@property(nonatomic,strong)NSMutableArray *incomeDataArray;

@property(nonatomic,strong)NSMutableArray *spendingDataArray;

@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation zhuandaqianTianYaClassificationManagementViewController
@dynamic view;
- (void)loadView
{
    zhuandaqianTianYaClassificationManagementView *view = [[zhuandaqianTianYaClassificationManagementView alloc]init];
    self.view = view;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"Classification Management";
    [self incomeLoadData];

    [self.view.segment addTarget:self action:@selector(segmentBtnClick:) forControlEvents:UIControlEventValueChanged];
    
    UITapGestureRecognizer *edit_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(custom_Classification_name)];
    [self.view.customLable addGestureRecognizer:edit_tap];
    
    self.view.tableView.delegate = self;
    self.view.tableView.dataSource = self;

    [self.view.tableView registerNib:[UINib nibWithNibName:@"zhuandaqianTianYaClassificationTableViewCell" bundle:nil] forCellReuseIdentifier:@"classificationCell"];
    
}

-(void)custom_Classification_name{
    

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"Please enter the category name" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:nil]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
         UITextField *userNameTextField = alertController.textFields.firstObject;
//        [nUserDefault setObject:userNameTextField.text forKey:@"sign_name"];
        if (userNameTextField.text.length == 0) {
            [BDProgressHUD ShowHudWithText:@"Can't be empty"];
        }else{
            zhuandaqianTianYaClassificationManagementModel *model = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
            
            model.img_name = @"type_reduce";
            model.classificationManagement_name = userNameTextField.text;
            
            if ([self.view.segment selectedSegmentIndex] == 0) {
                
                [self.incomeDataArray addObject:model];
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:self.incomeDataArray];
                [userDefaults setObject:arrayData forKey:@"incomeDataArray"];
                [userDefaults synchronize];
                
            }else{
                
                [self.spendingDataArray addObject:model];
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:self.spendingDataArray];
                [userDefaults setObject:arrayData forKey:@"spendingDataArray"];
                [userDefaults synchronize];
                
            }
        }
   
        
        
        [self.view.tableView reloadData];
        NSLog(@"支付密码：%@",userNameTextField.text);
        
    }]];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *_Nonnull textField) {
        
             textField.placeholder=@"Please enter the category name";
        
          }];
    
     dispatch_async(dispatch_get_main_queue(), ^{
        
        [self presentViewController: alertController animated: YES completion:nil];
        
    });
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.view.segment selectedSegmentIndex] == 0) {
        return _incomeDataArray.count;
    }else{
        return _spendingDataArray.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    zhuandaqianTianYaClassificationManagementModel *model;

    if ([self.view.segment selectedSegmentIndex] == 0) {
        model =  _incomeDataArray[indexPath.row];
    }else{
        model =  _spendingDataArray[indexPath.row];

    }
    
    zhuandaqianTianYaClassificationTableViewCell  *cell = [zhuandaqianTianYaClassificationTableViewCell cellWithTableView:tableView];
    [cell.deleteBtn addTarget:self action:@selector(delete_Classification:) forControlEvents:UIControlEventTouchDown];
    
    cell.deleteBtn.tag = indexPath.row;

    cell.model = model;
    
    return cell;
    
}
-(void)delete_Classification:(UIButton *)deleteBtn{
 
    NSString *errorStr =@"Are you sure you want to delete it?";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warm prompt" message:errorStr preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        zhuandaqianTianYaClassificationManagementModel *model;
        
        if ([self.view.segment selectedSegmentIndex] == 0) {
            
            model =  _incomeDataArray[deleteBtn.tag];
            [self.incomeDataArray removeObject:model];
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:_incomeDataArray];
            [userDefaults setObject:arrayData forKey:@"incomeDataArray"];
            [userDefaults synchronize];
            
        }else{
            
            model =  _spendingDataArray[deleteBtn.tag];
            [self.spendingDataArray removeObject:model];
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:_spendingDataArray];
            [userDefaults setObject:arrayData forKey:@"spendingDataArray"];
            [userDefaults synchronize];
            
            
        }
        
        [self.view.tableView reloadData];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    [alertController addAction:cancleAction];
    [alertController addAction:okAction];
    

    
    [self presentViewController:alertController animated:YES completion:nil];
    
   

    

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.view.tableView  deselectRowAtIndexPath:indexPath animated:NO];
    
}


-(void)incomeLoadData{
    
    //取出
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *arrayData = [userDefaults  objectForKey:@"incomeDataArray"];
    _incomeDataArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    if (_incomeDataArray == nil) {
        
        _incomeDataArray = [[NSMutableArray alloc]init];
        
        zhuandaqianTianYaClassificationManagementModel *model1 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model1.classificationManagement_name = @"Bus";
        model1.img_name = @"type_bus";
        [_incomeDataArray addObject:model1];
        
        zhuandaqianTianYaClassificationManagementModel *model2 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model2.classificationManagement_name = @"Candy";
        model2.img_name = @"type_candy";
        [_incomeDataArray addObject:model2];
        
        zhuandaqianTianYaClassificationManagementModel *model3 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model3.classificationManagement_name = @"Cigarettes";
        model3.img_name = @"type_cigarette";
        [_incomeDataArray addObject:model3];
        
        zhuandaqianTianYaClassificationManagementModel *model4 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model4.classificationManagement_name = @"Clothing";
        model4.img_name = @"type_clothes";
        [_incomeDataArray addObject:model4];
        
        zhuandaqianTianYaClassificationManagementModel *model5 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model5.classificationManagement_name = @"Meal";
        model5.img_name = @"type_eat";
        [_incomeDataArray addObject:model5];
        
        zhuandaqianTianYaClassificationManagementModel *model6 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model6.classificationManagement_name = @"Fitness";
        model6.img_name = @"type_fitness";
        [_incomeDataArray addObject:model6];
        
        zhuandaqianTianYaClassificationManagementModel *model7 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model7.classificationManagement_name = @"House";
        model7.img_name = @"type_home";
        [_incomeDataArray addObject:model7];
        
        zhuandaqianTianYaClassificationManagementModel *model8 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model8.classificationManagement_name = @"Gift";
        model8.img_name = @"type_humanity";
        [_incomeDataArray addObject:model8];

        zhuandaqianTianYaClassificationManagementModel *model9 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model9.classificationManagement_name = @"Movie";
        model9.img_name = @"type_movie";
        [_incomeDataArray addObject:model9];
        
        zhuandaqianTianYaClassificationManagementModel *model10 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model10.classificationManagement_name = @"Bmedical";
        model10.img_name = @"type_pill";
        [_incomeDataArray addObject:model10];
        
        zhuandaqianTianYaClassificationManagementModel *model11 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model11.classificationManagement_name = @"Plan";
        model11.img_name = @"type_plain";
        [_incomeDataArray addObject:model11];
  
        zhuandaqianTianYaClassificationManagementModel *model12 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model12.classificationManagement_name = @"Shopping";
        model12.img_name = @"type_shopping";
        [_incomeDataArray addObject:model12];
        
        zhuandaqianTianYaClassificationManagementModel *model13 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model13.classificationManagement_name = @"Phone";
        model13.img_name = @"type_sim";
        [_incomeDataArray addObject:model13];
        
        zhuandaqianTianYaClassificationManagementModel *model14 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model14.classificationManagement_name = @"Train";
        model14.img_name = @"type_train";
        [_incomeDataArray addObject:model14];
        
    }

    [self.view.tableView reloadData];
}

-(void)spendingLoadData{
    //取出
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *arrayData = [userDefaults  objectForKey:@"spendingDataArray"];
    _spendingDataArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayData];
    
    
    if (_spendingDataArray == nil) {
        
        _spendingDataArray = [[NSMutableArray alloc]init];
        
        zhuandaqianTianYaClassificationManagementModel *model1 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model1.classificationManagement_name = @"Wage";
        model1.img_name = @"type_salary";
        [_spendingDataArray addObject:model1];
        
        zhuandaqianTianYaClassificationManagementModel *model2 = [[zhuandaqianTianYaClassificationManagementModel alloc]init];
        model2.classificationManagement_name = @"Financial";
        model2.img_name = @"type_handling_fee";
        [_spendingDataArray addObject:model2];
        
    }
 
    
    [self.view.tableView reloadData];
}
-(void)segmentBtnClick:(UISegmentedControl*)segment
{
    switch ([segment selectedSegmentIndex]) {
        case 0:
        {
            [self incomeLoadData];
            NSLog(@"dafsfadsf0");
        }
            break;
        case 1:
        {
            [self spendingLoadData];
            NSLog(@"dafsfadsf1");

        }
            
            break;
        default:
            break;
    }
    
    
}

@end
