//
//  PersonCell.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Name)(NSString *name);

@interface PersonCell : UITableViewCell

@property (weak, nonatomic) IBOutlet QMUIButton *Player_photo;
@property (weak, nonatomic) IBOutlet UITextField *Player_name;

@property (nonatomic ,strong)Name name;

@end

NS_ASSUME_NONNULL_END
