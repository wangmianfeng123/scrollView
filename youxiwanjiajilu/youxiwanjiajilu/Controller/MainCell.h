//
//  MainCell.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *competition_img;
@property (weak, nonatomic) IBOutlet UILabel *competition_name;
@property (weak, nonatomic) IBOutlet UILabel *competition_score;
@property (weak, nonatomic) IBOutlet UILabel *competition_date;
@property (weak, nonatomic) IBOutlet UILabel *competition_persons;

@end

NS_ASSUME_NONNULL_END
