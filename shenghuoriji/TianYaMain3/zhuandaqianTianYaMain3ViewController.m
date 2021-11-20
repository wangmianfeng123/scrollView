//
//  zhuandaqianTianYaMain3ViewController.m
//  TianYa
//
//  Created by 程本德 on 2019/3/8.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaMain3ViewController.h"
#import "TianYaE_Macro.h"
#import "zhuandaqianTianYaClassificationManagementModel.h"
#import "zhuandaqianTianYaAddPillCollectionViewCell.h"
#import "zhuandaqianTianYaBillModel.h"
#import "leseDatePicker.h"
#import "zhuandaqianTianYaTabBarViewController.h"
#import "UIViewController+TabbyPdabtn.h"
#import "zhuandaqianTianYaClassificationManagementViewController.h"


@interface zhuandaqianTianYaMain3ViewController ()
{
    BQLDBTool *tool;
}


@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *incomeDataArray;
@property(nonatomic,strong)NSMutableArray *spendingDataArray;

@property(nonatomic,copy)NSString *bill_type;
@property(nonatomic,copy)NSString *bill_name;
@property(nonatomic,copy)NSString *bill_image;
@property(nonatomic,copy)NSString *bill_money;
@property(nonatomic,copy)NSString *bill_date;
@property(nonatomic,copy)NSString *bill_note;

@end

@implementation zhuandaqianTianYaMain3ViewController
@dynamic view;




- (void)loadView
{
    zhuandaqianTianYaAddBillView *view = [[zhuandaqianTianYaAddBillView alloc]init];
    self.view = view;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"addBill";
    tool = [BQLDBTool instantiateTool];
    [self incomeLoadData];
    [self crateCollectionView];
    [self.view.segment addTarget:self action:@selector(segmentBtnClick:) forControlEvents:UIControlEventValueChanged];
    [self.view.commitBtn addTarget:self action:@selector(commitData) forControlEvents:UIControlEventTouchDown];
    UITapGestureRecognizer *edit_tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectDate)];
    self.view.dateText.userInteractionEnabled = YES;
    [self.view.dateText addGestureRecognizer:edit_tap];
    self.view.dateText.text = [self getTime];
    [self insertRightButtonTitleStr:@"编辑" AndAction:@selector(bianjitamen:)];
}




-(void)bianjitamen:(UIButton *)btn{
    zhuandaqianTianYaClassificationManagementViewController *vc = [[zhuandaqianTianYaClassificationManagementViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}




-(void)commitData{
    
    NSLog(@"dagadg");
    
    if (self.view.moneyTextField.text.length <= 0 ) {
        
        [BDProgressHUD ShowHudWithText:@"You have unentered options"];
        
    }else{
        NSString *bill_type;
        NSString *bill_money;
        if ([self.view.segment selectedSegmentIndex] == 0) {
          
            bill_type = @"Spending";
            bill_money=self.view.moneyTextField.text;

        }else{
            bill_type = @"Income";
            bill_money=self.view.moneyTextField.text;

        }
        NSString *bill_name=self.view.typeText.text;
        NSString *bill_date=self.view.dateText.text;
        NSString *bill_note=self.view.noteTextField.text;

        
        
        zhuandaqianTianYaBillModel *model = [zhuandaqianTianYaBillModel modelWithDictionary:@{
                                                              @"bill_type":bill_type,
                                                              @"bill_name":bill_name,
                                                              @"bill_money":bill_money,
                                                              @"bill_date":bill_date,
                                                              @"bill_note":bill_note,
                                                              @"bill_image":_bill_image
                                                              }];
        
        
        if([tool insertDataWith:BillListFile Model:model])
        {
            self.view.moneyTextField.text = @"";
            self.view.noteTextField.text = @"";
            
            [BDProgressHUD ShowHudWithText:@"Save success"];
            
            [self.navigationController popViewControllerAnimated:YES];
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            zhuandaqianTianYaTabBarViewController *tab = (zhuandaqianTianYaTabBarViewController *)delegate.window.rootViewController;
            tab.selectedIndex = 0;
            
        }
        else
        {
            [BDProgressHUD ShowHudWithText:@"Save failed"];
            
        }
        
    }
    
    
}
-(NSString *)getTime{
    
    NSDate *date =[NSDate date];//简书 FlyElephant
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    NSString *time = [NSString stringWithFormat:@"%ld:%ld:%ld",currentYear,currentMonth,currentDay];
    return time;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)selectDate{

    [[leseDatePicker shareManager]showWithType:PickerTypeDay title:nil time:[self getTime] backTime:^(NSString * _Nonnull backTimeStr) {
        NSLog(@"%@",backTimeStr);
        self.view.dateText.text = backTimeStr;

    }];
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
    
    for (NSInteger i = 0; i <_incomeDataArray.count; i++) {
        if (i == 0) {
            zhuandaqianTianYaClassificationManagementModel *model = _incomeDataArray[0];
            model.isSelete = @"1";
        }else{
            zhuandaqianTianYaClassificationManagementModel *model = _incomeDataArray[i];
            model.isSelete = @"0";
        }
    }
    [self.collectionView reloadData];
    zhuandaqianTianYaClassificationManagementModel *model = _incomeDataArray[0];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    self.view.typeText.text = model.classificationManagement_name;
    _bill_image = model.img_name;
    //设置第一行
    [_collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
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
    
    for (NSInteger i = 0; i <_spendingDataArray.count; i++) {
        if (i == 0) {
            zhuandaqianTianYaClassificationManagementModel *model = _spendingDataArray[0];
            model.isSelete = @"1";
        }else{
            zhuandaqianTianYaClassificationManagementModel *model = _spendingDataArray[i];
            model.isSelete = @"0";
        }
    }
    [self.collectionView reloadData];
    zhuandaqianTianYaClassificationManagementModel *model = _spendingDataArray[0];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    self.view.typeText.text = model.classificationManagement_name;
    _bill_image = model.img_name;
    //设置第一行
    [_collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    

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
-(void)crateCollectionView{
    
    //关闭自适应
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200) collectionViewLayout:fl];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    fl.itemSize = CGSizeMake(80, 100);

    [self.view.collectionView addSubview: _collectionView];
    
    //布局
    
    fl.minimumInteritemSpacing = 0;
    
    fl.minimumLineSpacing = 0;
    
    //注册cell
    
    [_collectionView registerNib:[UINib nibWithNibName:@"zhuandaqianTianYaAddPillCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"addPill_cell"];
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0.5, 0, 0);
    
    
}
// 定义上下cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.5;
}

// 定义左右cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.5;
}
#pragma mark - collectionView dataSource Or delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([self.view.segment selectedSegmentIndex] == 0) {
        return _incomeDataArray.count;
    }else{
        return _spendingDataArray.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    zhuandaqianTianYaClassificationManagementModel *model;
    
    if ([self.view.segment selectedSegmentIndex] == 0) {
        model =  _incomeDataArray[indexPath.row];
    }else{
        model =  _spendingDataArray[indexPath.row];
        
    }
    static NSString *cell_id = @"addPill_cell";
    zhuandaqianTianYaAddPillCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_id forIndexPath:indexPath];
    
    cell.classification_name.text = model.classificationManagement_name;
    if ([model.isSelete isEqualToString:@"1"]) {
        
        cell.img_name.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",model.img_name]];
        cell.classification_name.textColor = [UIColor colorWithHexString:@"808080"];
    }else if([model.isSelete isEqualToString:@"0"]){
        
        cell.img_name.image = [UIImage imageNamed:model.img_name];
        cell.classification_name.textColor = [UIColor blackColor];

    }
    
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.view.segment selectedSegmentIndex] == 0) {
        
        for (NSInteger i = 0; i <_incomeDataArray.count; i++) {
            if (i == indexPath.row) {
                zhuandaqianTianYaClassificationManagementModel *model = _incomeDataArray[i];
                model.isSelete = @"1";
                self.view.typeText.text = model.classificationManagement_name;
                _bill_image = model.img_name;
            }else{
                zhuandaqianTianYaClassificationManagementModel *model = _incomeDataArray[i];
                model.isSelete = @"0";
            }
        }
    }else{
        for (NSInteger i = 0; i <_spendingDataArray.count; i++) {
            if (i == indexPath.row) {
                zhuandaqianTianYaClassificationManagementModel *model = _spendingDataArray[i];
                model.isSelete = @"1";
                self.view.typeText.text = model.classificationManagement_name;
                _bill_image = model.img_name;
            }else{
                zhuandaqianTianYaClassificationManagementModel *model = _spendingDataArray[i];
                model.isSelete = @"0";
            }
        }
        
    }

    [self.collectionView reloadData];

}


@end
