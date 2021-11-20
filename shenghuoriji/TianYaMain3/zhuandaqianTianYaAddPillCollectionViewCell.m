//
//  zhuandaqianTianYaAddPillCollectionViewCell.m
//  TianYa
//
//  Created by 程本德 on 2019/3/14.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaAddPillCollectionViewCell.h"

@implementation zhuandaqianTianYaAddPillCollectionViewCell

-(void)setModel:(zhuandaqianTianYaClassificationManagementModel *)model{
    
    self.model = model;
    self.img_name.image = [UIImage imageNamed:_model.img_name];
    self.classification_name.text = _model.classificationManagement_name;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
