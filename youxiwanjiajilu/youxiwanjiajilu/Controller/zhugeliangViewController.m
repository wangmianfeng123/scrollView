//
//  zhugeliangViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "zhugeliangViewController.h"
#import "BetRecordCell.h"

@interface zhugeliangViewController ()

@property (weak, nonatomic) IBOutlet UITableView *RecordTableview;

@property (nonatomic ,strong) QMUIEmptyView * empty;

@property (nonatomic ,strong) NSArray * array;


@end

@implementation zhugeliangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.RecordTableview registerNib:[UINib nibWithNibName:@"BetRecordCell" bundle:nil] forCellReuseIdentifier:@"BetRecordCell"];
    
    self.RecordTableview.tableFooterView = [UIView new];
    
    
    NSString * where = [NSString stringWithFormat:@"where %@=%@",bg_sqlKey(@"texas"),bg_sqlValue(self.texas.bg_id)];
    
    self.navigationItem.title =@"Record";
    
    self.array = [Record bg_find:@"Record" where:where];

    if (self.array.count == 0) {
         [self steupEmpty];
    }
    
    [Record bg_registerChangeForTableName:@"Record" identify:@"change" block:^(bg_changeState result) {
        switch (result) {
            case bg_insert:
                if (self->_empty) {
                    [self->_empty removeFromSuperview];
                }
                self.array = [Record bg_find:@"Record" where:where];
                
                [self->_RecordTableview reloadData];
                
                break;
            case bg_update:
                
                break;
            case bg_delete:
                
                break;
            case bg_drop:
                
                break;
            default:
                break;
        }
    }];
}


-(void)steupEmpty{
    
    self.empty =[[QMUIEmptyView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth, kScreenHeight-88)];
    
    [self.empty setBackgroundColor:[UIColor clearColor]];
    
    [self.empty setImage: [[UIImage imageNamed:@"emptybox"] qmui_imageResizedInLimitedSize:CGSizeMake(60, 60) resizingMode:QMUIImageResizingModeScaleToFill]];
    
    [self.empty setTextLabelText:@"empty"];
    
    [self.empty setLoadingViewHidden:YES];
    
    [self.view addSubview:self.empty];
    
    
}


#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BetRecordCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"BetRecordCell" forIndexPath:indexPath];
    
    Record * record = [self.array objectAtIndex:indexPath.row];
    
   
    cell.name.text = [NSString stringWithFormat:@"Name : %@",record.name];
    
    cell.time.text = record.time;
    
    cell.bet.text = [NSString stringWithFormat:@"Bet :+ %d",record.bet];
    
    cell.current.text = [NSString stringWithFormat:@"current : %d",record.current];
    
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}




@end
