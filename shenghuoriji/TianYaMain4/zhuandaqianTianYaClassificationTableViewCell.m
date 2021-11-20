//
//  zhuandaqianTianYaClassificationTableViewCell.m
//  TianYa
//
//  Created by 程本德 on 2019/3/13.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaClassificationTableViewCell.h"
#import "zhuandaqianTianYaClassificationManagementModel.h"
@implementation zhuandaqianTianYaClassificationTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    
    static NSString *ID = @"classificationCell";
    zhuandaqianTianYaClassificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"zhuandaqianTianYaClassificationTableViewCell" owner:nil options:nil] lastObject];
        
    }
    
    return cell;
    
}
- (void)setFrame:(CGRect)frame
{
    
    frame.size.height-=1;
    
    [super setFrame:frame];
    
}

-(void)setModel:(zhuandaqianTianYaClassificationManagementModel *)model
{
    _model = model;
    
//    NSLog(@"222-%@",_model.user_name);
    
    self.imgName.image = [UIImage imageNamed:_model.img_name];
    self.classificationName.text = _model.classificationManagement_name;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
