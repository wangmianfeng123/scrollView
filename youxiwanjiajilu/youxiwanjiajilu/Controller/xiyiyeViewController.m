//
//  xiyiyeViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "xiyiyeViewController.h"
#import "yanzhizaixianCell.h"
#import "BetAmountsCell.h"
#import "zhugeliangViewController.h"
#import "chongdianqiHelper.h"

@interface xiyiyeViewController ()<UICollectionViewDelegate , UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *detailtableview;
@property (nonatomic , strong)UICollectionView * collectionView;
@property (nonatomic ,strong) NSIndexPath * SelectindexPath;
@property (nonatomic , strong)NSArray * array;
@property (nonatomic , strong)NSString * Bet;
@property (weak, nonatomic) IBOutlet UIButton *endbutton;

@end

@implementation xiyiyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self steupUI];
    
    self.array = @[@"10",@"20",@"50",@"100",@"200",@"500"];
    
    self.potAmount.text = [NSString stringWithFormat:@"Amount Pot:%lu",self.texas.pot];
    
    self.BlindsAmount.text =[NSString stringWithFormat:@"%d",self.texas.bet];
    
    self.initialAmount.text =[NSString stringWithFormat:@"Initial : %d",self.texas.score];
    
    
    if ([self.texas.status isEqualToString:@"end"]) {
        
        [self.endbutton setEnabled:NO];
        
        [self.detailtableview setUserInteractionEnabled:NO];
        
        [self.endbutton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        
        
        self.texas.status = @"end";
        
        [self.texas bg_saveOrUpdate];
    }
    
    
    
}



-(void)steupUI{
    
    
    QMUIButton * button_right =[[QMUIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 30)];
    
    [button_right setTitle:@"BET" forState:UIControlStateNormal];
    
    [button_right qmui_setTitleAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    
    [button_right setTintColorAdjustsTitleAndImage:kColorWithHex(0xFFFFFF)];
    
    [button_right setQmui_tapBlock:^(__kindof UIControl *sender) {
        
        zhugeliangViewController * zhugeliang =[[zhugeliangViewController alloc]initWithNibName:@"zhugeliangViewController" bundle:nil];
        
        zhugeliang.texas = self->_texas;
        
        [self.navigationController pushViewController:zhugeliang animated:YES];
    }];
    
    UIBarButtonItem * barButoonItem_right = [[UIBarButtonItem alloc]initWithCustomView:button_right];
    self.navigationItem.rightBarButtonItems =@[barButoonItem_right];
    
    self.navigationItem.title = @"Detail Competition";
    [self.detailtableview registerNib:[UINib nibWithNibName:@"yanzhizaixianCell" bundle:nil] forCellReuseIdentifier:@"yanzhizaixianCell"];
    self.detailtableview.tableFooterView =[UIView new];
    
  
    
    
    
}
#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _texas.Players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    yanzhizaixianCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"yanzhizaixianCell" forIndexPath:indexPath];
    
    Player * player = [_texas.Players objectAtIndex:indexPath.row];
    
    cell.poker_photo.image = [UIImage imageWithData:player.photoData];
    
    cell.poker_name.text = [NSString stringWithFormat:@"Name : %@", player.name];
    
    cell.poker_score.text = [NSString stringWithFormat:@"Total: %d", player.Amount];
    
    cell.bet_amount.text = [NSString stringWithFormat:@"Bet: %d", player.betamount];

    
    [cell.poker_bet setQmui_tapBlock:^(__kindof UIControl *sender) {
        
        [QMUIDialogViewController appearance].headerViewBackgroundColor  = kColorWithHex(0x000000);
        
        [QMUIDialogViewController appearance].headerViewHeight =50;
        
        
        
        QMUIDialogViewController *dilog = [[QMUIDialogViewController alloc]init];
        
        dilog.title = @"Amount bet";
        
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 300, 200) collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerNib:[UINib nibWithNibName:@"BetAmountsCell" bundle:nil] forCellWithReuseIdentifier:@"BetAmountsCell"];
        
        [dilog setContentView:self.collectionView];
        
        [dilog addCancelButtonWithText:@"Cancel" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
            
            [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
                
            }];
            
        }];
        [dilog addSubmitButtonWithText:@"Confirm" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
            
            
            player.Amount = player.Amount- [self->_Bet intValue];
            
            player.betamount = player.betamount + [self->_Bet intValue];
            
            self->_texas.pot = self->_texas.pot +[self->_Bet intValue];

            [player bg_saveOrUpdate];
            
            [self->_texas bg_saveOrUpdate];
            
            self.potAmount.text = [NSString stringWithFormat:@"Amount Pot : %lu",self->_texas.pot];
            
            cell.poker_score.text = [NSString stringWithFormat:@"Total: %d", player.Amount];
            
            cell.bet_amount.text = [NSString stringWithFormat:@"Bet: %d", player.betamount];
            

            Record * record = [[Record alloc]init];
            
            record.bet = [self->_Bet intValue] ;
            
            record.time = [chongdianqiHelper dateFormatterAMAndPM];
            
            record.name = player.name;
            
            record.current =  player.Amount;
            
            record.texas = self->_texas.bg_id;
            
            record.bg_tableName = @"Record";
            
            if([record bg_save]){
                
            };
           
            
            
            [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
                
                
                
                
                
            }];
            
        }];
        [dilog setButtonBackgroundColor:kColorWithHex(0x000000)];
        [dilog setButtonTitleAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:17]}];
        
        
        [dilog showWithAnimated:YES completion:^(BOOL finished) {
            
        }];
        
        
        
        
        
    }];
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BetAmountsCell * betCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BetAmountsCell" forIndexPath:indexPath];
    
    betCell.AmountsBetLabel.text = [self.array objectAtIndex:indexPath.row];
    
    return betCell;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return CGSizeMake((300-80)/3,80);
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(5, 10, 5, 10);
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (self.SelectindexPath) {
         BetAmountsCell * cell = (BetAmountsCell*)[collectionView cellForItemAtIndexPath:self.SelectindexPath];
        cell.AmountsBetLabel.backgroundColor = kColorWithHex(0xE9E9E9);

        cell.AmountsBetLabel.textColor = kColorWithHex(0x000000);
    }
    
    self.SelectindexPath = indexPath;
    
    self.Bet = [_array objectAtIndex:indexPath.row];
    
    BetAmountsCell * cell = (BetAmountsCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.AmountsBetLabel.backgroundColor = kColorWithHex(0x1296db);
   
    cell.AmountsBetLabel.textColor = kColorWithHex(0xFFFFFF);

    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return 6;
    
}

- (IBAction)endpokercompetition:(id)sender {
    
    [self.endbutton setEnabled:NO];
    
    [self.detailtableview setUserInteractionEnabled:NO];
    
    [self.endbutton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
    
    
    self.texas.status = @"end";
    
    [self.texas bg_saveOrUpdate];
}


//
///**
// 分区内cell之间的最小行间距
// */
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 20;
//}
///**
// 分区内cell之间的最小列间距
// */
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 20;
//}


@end
