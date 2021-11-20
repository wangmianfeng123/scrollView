//
//  yanzhizaixianCell.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface yanzhizaixianCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *poker_photo;


@property (weak, nonatomic) IBOutlet UILabel *poker_name;


@property (weak, nonatomic) IBOutlet UILabel *bet_amount;


@property (weak, nonatomic) IBOutlet UILabel *poker_score;


@property (weak, nonatomic) IBOutlet QMUIButton *poker_bet;

@end

NS_ASSUME_NONNULL_END
