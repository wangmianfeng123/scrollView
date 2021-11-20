//
//  xianyumaihuoViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "xianyumaihuoViewController.h"
#import "PersonCell.h"
@interface xianyumaihuoViewController ()<TZImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *personTableview;

@property (nonatomic ,strong)NSMutableArray *array_players;

@end

@implementation xianyumaihuoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self data];
    
    [self steupUI];
    

}


-(void)steupUI{
    
    [self.personTableview registerNib:[UINib nibWithNibName:@"PersonCell" bundle:nil] forCellReuseIdentifier:@"PersonCell"];
    
    self.personTableview.tableFooterView =[UIView new];
    
    self.navigationItem.title = @"Add Player";
    
    
    QMUIButton * button_right =[[QMUIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 25)];
    
    [button_right setTitle:@"INCREASE" forState:UIControlStateNormal];
    
    [button_right qmui_setTitleAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    
    [button_right setTintColorAdjustsTitleAndImage:kColorWithHex(0xFFFFFF)];
    
    [button_right setQmui_tapBlock:^(__kindof UIControl *sender) {
        
        
        Player * player = [[Player alloc]init];
        
        player.name = @"";
        
        player.photoData = UIImagePNGRepresentation([UIImage imageNamed:@"touxiang"]);
        
        player.Amount = 0;
        
        [self->_array_players addObject:player];
        
        
        [self->_personTableview reloadData];
        
    }];
    
    UIBarButtonItem * barButoonItem_right = [[UIBarButtonItem alloc]initWithCustomView:button_right];
    self.navigationItem.rightBarButtonItems =@[barButoonItem_right];

    
    
}



-(void)data{
    
    
    
    if (!_array_players) {
         _array_players = [[NSMutableArray alloc]init];
    }
    
        for (int i = 0 ; i<3; i++) {
            
            Player * player = [[Player alloc]init];
            
            player.name = @"";
            
            player.photoData = UIImagePNGRepresentation([UIImage imageNamed:@"touxiang"]);
            
            player.Amount = 0;

            
            [_array_players addObject:player];
            
        }
    
    
    
}



#pragma mark - tableview delegate / dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  _array_players.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PersonCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PersonCell" owner:self options:nil] firstObject];
        //[[PersonCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"PersonCell"];
    }
    Player * player =  [self->_array_players objectAtIndex:indexPath.row];

    [cell.Player_photo setBackgroundImage:[UIImage imageWithData:player.photoData] forState:UIControlStateNormal];
    cell.Player_name.text = player.name;

    
    cell.name = ^(NSString * _Nonnull name) {
        
        player.name = name;
    };
    
    
    [cell.Player_photo setQmui_tapBlock:^(__kindof UIControl *sender) {
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        
        
        imagePickerVc.naviBgColor =  [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1];
        
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            
            
            UIImage * image = photos[0];
            
            [cell.Player_photo setBackgroundImage:[image cropImageWithSize:CGSizeMake(70, 70)] forState:UIControlStateNormal];
            
            player.photoData = UIImagePNGRepresentation([image cropImageWithSize:CGSizeMake(70, 70)]);
            
            
        }];
        
        
        [self presentViewController:imagePickerVc animated:YES completion:nil];
        
        
    }];
    
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}








- (IBAction)conforma_pend:(id)sender {
    
    self.players(_array_players);
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    return UITableViewCellEditingStyleDelete;
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    

    
    
    switch (editingStyle) {
        case 1:

            [self.array_players removeObjectAtIndex:indexPath.row];

            [tableView reloadData];
            
            break;
            
        default:
            break;
    }
    
    
}


@end
