//
//  shimujiajuViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "shimujiajuViewController.h"
#import "xianyumaihuoViewController.h"

#import "TZImagePickerController.h"
#import "daishuPickerView.h"

@interface shimujiajuViewController ()<TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *competition_photo;
@property (weak, nonatomic) IBOutlet UITextField *competition_title;
@property (weak, nonatomic) IBOutlet UILabel *competition_date;
@property (weak, nonatomic) IBOutlet UITextField *competition_first_score;
@property (weak, nonatomic) IBOutlet UITextField *competition_Amountbet;

@property (nonatomic , strong) NSMutableArray * Players;

@property (nonatomic , strong) Texas * texas;

@end

@implementation shimujiajuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Add Competition";
    _texas = [[Texas alloc]init];
}
- (IBAction)Competition:(id)sender {
    
    if (![_competition_photo.image isEqual:[UIImage imageNamed:@"saishi"]] && _competition_title.text.length != 0 && ![_competition_date.text isEqualToString:@"Select Date"] && _competition_first_score.text.length != 0 && _competition_Amountbet.text.length != 0 && self.Players.count>0) {
        
        
        
        _texas.title = _competition_title.text;
        
        _texas.photoData = UIImagePNGRepresentation(_competition_photo.image);
        
        _texas.date = _competition_date.text;
        
        _texas.score = [_competition_first_score.text intValue];
        
        _texas.bet = [_competition_Amountbet.text intValue];
        
        _texas.Players = self.Players;
        
        
        for (Player *player in _texas.Players) {
            
            player.Amount = _texas.score-_texas.bet;
            
            player.betamount = _texas.bet;
        }
            
        
        _texas.pot  = self.Players.count * _texas.bet;
        
        _texas.bg_tableName = @"Texas";
        
        if( [_texas bg_save]){
            
            [self.navigationController popViewControllerAnimated:YES];
        };
        
    }else{
        
        if ([_competition_photo.image isEqual:[UIImage imageNamed:@"saishi"]]) {
            
            
            [nixiangzayangHUD showToast:@"Please add competition picture" completion:^{
                
            }];
            
        }else if(_competition_title.text.length == 0){
            
            [nixiangzayangHUD showToast:@"The title cannot be empty" completion:^{
                
            }];
            
            
        }else if([_competition_date.text isEqualToString:@"Select Date"]){
            
            [nixiangzayangHUD showToast:@"The date cannot be empty" completion:^{
                
            }];
            
            
        }else if(_competition_first_score.text.length == 0){
            
            
            [nixiangzayangHUD showToast:@"The Initialamount cannot be empty" completion:^{
                
            }];
            
        }else if(_competition_Amountbet.text.length == 0){
            
            [nixiangzayangHUD showToast:@"The Blindsamount cannot be empty" completion:^{
                
            }];
            
            
        }else{
            
            [nixiangzayangHUD showToast:@"Please add competition Players" completion:^{
                
            }];
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}


- (IBAction)addperson:(id)sender {
    
    
    
    
    xianyumaihuoViewController * xianyumaihuo = [[xianyumaihuoViewController alloc]init];
    
    
    xianyumaihuo.texas = _texas;

    
    xianyumaihuo.players = ^(NSMutableArray * _Nonnull players) {
        
        self->_Players  = players;
        
    };
    
    [self.navigationController pushViewController:xianyumaihuo animated:YES];
    
    
}
- (IBAction)addPhoto:(id)sender {
    
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    
    imagePickerVc.naviBgColor =  [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1];
    
    __weak typeof(self) weakSelf =self;
    
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        
        UIImage * image = photos[0];
        weakSelf.competition_photo.image = [image cropImageWithSize:CGSizeMake(60, 60)];
        
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
    
}
- (IBAction)competitiondate:(id)sender {
    
    
    daishuPickerView *datepicker = [[daishuPickerView alloc] initWithCurrentDate:[NSDate date:@"2019-6-15 11:11" WithFormat:@"yyyy-MM-dd HH:mm"] CompleteBlock:^(NSDate *startDate) {
        
        self->_competition_date.text  = [self getTimeFormatterWithDate:startDate];
    }];
    datepicker.themeColor = kColorWithHex(0x4594D5);
    //datepicker.datePickerStyle = DateStyleShowYearMonthDay;
    datepicker.datePickerStyle = DateStyleShowYearMonthDayHourMinute;
    //    datepicker.datePickerStyle = DateStyleShowMonthDayHourMinute;
    //    datepicker.datePickerStyle = DateStyleShowYearMonthDay;
    //    datepicker.datePickerStyle = DateStyleShowMonthDay;
    //datepicker.datePickerStyle = DateStyleShowHourMinute;
    datepicker.minLimitDate = [NSDate date:@"1997-2-28 12:22" WithFormat:@"yyyy-MM-dd HH:mm"];
    datepicker.maxLimitDate = [NSDate date:@"2022-12-28 22:12" WithFormat:@"yyyy-MM-dd HH:mm"];
    // 默认值——选择时间
    datepicker.title =  @"Select Date";
    [datepicker show];
    
}


-(NSString *)getNoTime{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSString *time =[formatter stringFromDate:[NSDate date]];
    
    return time;
    
}
-(NSString *)getTimeFormatterWithDate:(NSDate*)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm a"];
    
    formatter.AMSymbol = @"AM";
    
    formatter.PMSymbol = @"PM";
    
    NSString *time =[formatter stringFromDate:date];
    
    return time;
    
}




@end
