//
//  anyoushuibeiCell.h
//  DMinutes
//
//  Created by MoMo on 2019/5/17.
//  Copyright © 2019 DM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface anyoushuibeiCell : MGSwipeTableCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *catoary;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *destdate;
@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet UIView *bgmView;
@property (weak, nonatomic) IBOutlet UILabel *hour;

@end

NS_ASSUME_NONNULL_END
