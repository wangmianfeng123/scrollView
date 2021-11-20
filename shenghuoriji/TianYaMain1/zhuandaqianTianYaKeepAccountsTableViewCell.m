//
//  zhuandaqianTianYaKeepAccountsTableViewCell.m
//  TianYa
//
//  Created by 程本德 on 2019/3/15.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaKeepAccountsTableViewCell.h"
#import "zhuandaqianTianYaBillModel.h"
@implementation zhuandaqianTianYaKeepAccountsTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    
    static NSString *ID = @"keepAccountsCell";
    zhuandaqianTianYaKeepAccountsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"zhuandaqianTianYaKeepAccountsTableViewCell" owner:nil options:nil] lastObject];
        
    }
    
    return cell;
    
}
- (void)setFrame:(CGRect)frame

{
    
    frame.size.height-=1;
    
    [super setFrame:frame];
    
}

-(void)setModel:(zhuandaqianTianYaBillModel *)model
{
    _model = model;
    
    //    NSLog(@"222-%@",_model.user_name);
    
    self.img_name.image = [UIImage imageNamed:_model.bill_image];
    self.type_name.text = _model.bill_name;
    if ([_model.bill_type isEqualToString:@"Income"]) {
        self.money.text = [NSString stringWithFormat:@"+%@",_model.bill_money];
        
    }else{
        
        self.money.text = [NSString stringWithFormat:@"-%@",_model.bill_money];

    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
