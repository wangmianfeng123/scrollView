//
//  gexinghuliViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "gexinghuliViewController.h"
#import "zidanfeiViewController.h"
#import "ClearCacheViewController.h"
#import "qichemingdiViewController.h"

@interface gexinghuliViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mineview;
@property (nonatomic ,strong) NSArray * array;
@end

@implementation gexinghuliViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.array =@[@"Info back",@"Clear cache",@"About us"];

    
    
    [self.mineview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    
    
    
    self.navigationItem.title =@"MINE";
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 1;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  [self.array count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    
    cell.textLabel.font =  [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:(17.0)];
  
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    return 70;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    if (indexPath.row==0) {
        
        zidanfeiViewController * feedback = [[zidanfeiViewController alloc]initWithNibName:@"zidanfeiViewController" bundle:nil];
        
        [self.navigationController pushViewController:feedback animated:YES];
    }else if (indexPath.row==1){
        
        ClearCacheViewController * chache = [[ClearCacheViewController alloc]initWithNibName:@"ClearCacheViewController" bundle:nil];
        
        [self.navigationController pushViewController:chache animated:YES];
        
    }else if (indexPath.row==2){
        
        qichemingdiViewController * aboutus = [[qichemingdiViewController alloc]initWithNibName:@"qichemingdiViewController" bundle:nil];
        
        [self.navigationController pushViewController:aboutus animated:YES];
        
    }
    
    
    
    
}



@end
