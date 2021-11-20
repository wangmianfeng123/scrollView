//
//  BetRecordCell.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/30.
//  Copyright © 2019 paien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BetRecordCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;


@property (weak, nonatomic) IBOutlet UILabel *time;


@property (weak, nonatomic) IBOutlet UILabel *bet;


@property (weak, nonatomic) IBOutlet UILabel *current;




@end

NS_ASSUME_NONNULL_END
